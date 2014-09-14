# Note: normally this package is built with a single compiler, and the rpms
# from multiple compiler builds will overwrite each other.

ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

NAME           = beagle_$(VERSION)_$(ROLLCOMPILER)
VERSION        = 1.1
RELEASE        = 0
PKGROOT        = /opt/beagle/$(VERSION)

SRC_SUBDIR     = beagle

SOURCE_NAME    = beagle
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
