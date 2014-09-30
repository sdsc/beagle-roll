PACKAGE     = beagle
CATEGORY    = applications

NAME        = $(PACKAGE)-modules
RELEASE     = 2
PKGROOT     = /opt/modulefiles/$(CATEGORY)/$(PACKAGE)

VERSION_SRC = $(REDHAT.ROOT)/src/$(PACKAGE)_1.1/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

ADD_VERSION = 2.1

RPM.EXTRAS  = AutoReq:No
