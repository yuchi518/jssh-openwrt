#
# Copyright (C) 2015 Yuchi
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=jssh
PKG_VERSION:=0.0.3
PKG_BUILD_DIR:=$(BUILD_DIR)/shell.js-$(PKG_NAME)-$(PKG_VERSION)-openwrt
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-openwrt.zip
PKG_SOURCE_URL:=https://github.com/yuchi518/shell.js/archive/
PKG_MD5SUM:=9b252c4fee7becba0561400f26ecefbd
PKG_CAT:=unzip

include $(INCLUDE_DIR)/package.mk

define Package/jssh
  SECTION:=base
  CATEGORY:=Languages
  DEFAULT:=y
  TITLE:=JavaScript shell
  URL:=https://github.com/yuchi518/shell.js/
  DEPENDS:=+libpthread
endef

define Package/jssh/description
 JavaScript shell.
endef

#define Build/Prepare
#endef

define Build/Configure
endef

define Build/Compile
	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" -C $(PKG_BUILD_DIR)
endef

define Package/jssh/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/jssh $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,jssh,+libpthread))

