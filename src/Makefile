
PREFIX ?= /usr/local

VERSION_MAJOR = 0
VERSION_MINOR = 1

LIBNAME = libxdgmime.so
SONAME = $(LIBNAME).$(VERSION_MAJOR)
LIBXDGMIME = $(SONAME).$(VERSION_MINOR)

CXX = $(CROSS_COMPILE)g++
CC  = $(CROSS_COMPILE)gcc
LD  = $(CROSS_COMPILE)ld

# TODO: use Autotools to detect <sys/mman.h>
# instead of hardcoding that...
CFLAGS += -fPIC -DHAVE_MMAP

INSTALL ?= install

OBJS =  xdgmime.o xdgmimeglob.o xdgmimeint.o xdgmimemagic.o \
		xdgmimealias.o xdgmimeparent.o xdgmimecache.o xdgmimeicon.o

.PHONY: all clean install install-lib

all: $(LIBXDGMIME)

$(LIBXDGMIME): $(OBJS)
	$(CC) -shared -Wl,-soname,$(SONAME) -o $@ $^ $(LDFLAGS)

install-lib: $(LIBXDGMIME)
	$(INSTALL) -D $(LIBXDGMIME) $(DESTDIR)$(PREFIX)/lib/$(LIBXDGMIME)
	ln -sf $(LIBXDGMIME) $(DESTDIR)$(PREFIX)/lib/$(SONAME)

install: install-lib
	$(INSTALL) -D -m 0644 xdgmime.h $(DESTDIR)$(PREFIX)/include/xdgmime.h

clean:
	rm -f $(OBJS) $(LIBXDGMIME)
