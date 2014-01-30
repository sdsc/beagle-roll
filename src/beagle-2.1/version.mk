VERSION = 2.1
NAME    = beagle-$(VERSION)_$(ROLLCOMPILER)
RELEASE = 0
PKGROOT = /opt/beagle/$(VERSION)

SOURCE_NAME        = beagle
SOURCE_DIR         = $(SOURCE_NAME)_$(VERSION)_src_trestles
RPM.EXTRAS         = AutoReq:No
