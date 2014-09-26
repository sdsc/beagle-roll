NAME        = beagle-modules
RELEASE     = 1
PKGROOT     = /opt/modulefiles/applications/beagle

VERSION_SRC = $(REDHAT.ROOT)/src/beagle_1.1/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

ADD_VERSION = 2.1

RPM.EXTRAS  = AutoReq:No
