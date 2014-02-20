VERSION = 1.1
NAME    = beagle_$(ROLLCOMPILER)
RELEASE = 0
PKGROOT = /opt/beagle/$(VERSION)

SOURCE_NAME        = beagle
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)
SRC_SUBDIR         = beagle

TAR_GZ_PKGS        = $(SOURCE_PKG)
RPM.EXTRAS         = AutoReq:No
