#BHEADER**********************************************************************
# # This file is part of BootCMatch.
# #
# # $release: 1.0 $
# #EHEADER**********************************************************************
include ./make.inc
##################################################################
# Targets
# ##################################################################
LIBNAME=libBCM.a

all: libdir includedir libs

libdir:
	(if test ! -d lib ; then mkdir lib; fi)
includedir:
	(if test ! -d include ; then mkdir include; fi; )

libs: msrc 
	/bin/mv $(LIBNAME) lib

###################################################################
# Rules
# ##################################################################
#

msrc:
	( cd SRC; $(MAKE) LIBNAME=$(LIBNAME))

mtest:
	( cd Test; $(MAKE) )

clean:
	( cd include; /bin/rm -f *.h)
	( cd lib; /bin/rm -f *.a)
	( cd SRC; $(MAKE) clean)
	( cd Test; $(MAKE) clean)
