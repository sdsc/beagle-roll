VERSION = 2.1
NAME    = beagle-$(VERSION)_$(ROLLCOMPILER)
RELEASE = 0
PKGROOT = /opt/beagle/$(VERSION)

SOURCE_SUFFIX      = tar.gz
SOURCE_NAME        = beagle
SOURCE_PKG         = $(SOURCE_NAME)-$(VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)
RPM.EXTRAS         = AutoReq:No

TAR_GZ_PKGS        = $(SOURCE_PKG)
