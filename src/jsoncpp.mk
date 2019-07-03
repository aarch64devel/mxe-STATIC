# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := jsoncpp
$(PKG)_WEBSITE  := https://github.com/open-source-parsers/jsoncpp
$(PKG)_DESCR    := A C++ library for interacting with JSON
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.9.0
$(PKG)_CHECKSUM := bdd3ba9ed1f110b3eb57474d9094e90ab239b93b4803b4f9b1722c281e85a4ac
$(PKG)_GH_CONF  := open-source-parsers/jsoncpp/tags,,,svn
$(PKG)_DEPS     := cc

# workaround for builds with GCC >= 6.x
$(PKG)_CXXFLAGS := -Wno-error=conversion -Wno-shift-negative-value

define $(PKG)_BUILD
    cd '$(BUILD_DIR)' && $(TARGET)-cmake '$(SOURCE_DIR)' \
        -DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF \
        -DCMAKE_CXX_FLAGS="$($(PKG)_CXXFLAGS)" \
        -DJSONCPP_WITH_CMAKE_PACKAGE=ON
    $(MAKE) -C '$(BUILD_DIR)' -j $(JOBS)
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install
endef
