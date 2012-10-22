SUBDIRS=src

all clean install install-lib:
	target=`echo $@ | sed s/-recursive//`;		\
	for subdir in $(SUBDIRS); do 			\
		(cd $$subdir && make "$$target")	\
	done;
