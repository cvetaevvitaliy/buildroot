################################################################################
#
# libxkbcommon
#
################################################################################

LIBXKBCOMMON_VERSION = 1.3.1
LIBXKBCOMMON_SITE = https://xkbcommon.org/download
LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
LIBXKBCOMMON_LICENSE = MIT/X11
LIBXKBCOMMON_LICENSE_FILES = LICENSE
LIBXKBCOMMON_INSTALL_STAGING = YES
LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
LIBXKBCOMMON_CONF_OPTS = \
	-Denable-docs=false \
	-Denable-wayland=true \
	-Denable-xkbregistry=true

ifeq ($(BR2_PACKAGE_XORG7),y)
LIBXKBCOMMON_CONF_OPTS += -Denable-x11=true
LIBXKBCOMMON_DEPENDENCIES += libxcb
else
LIBXKBCOMMON_CONF_OPTS += -Denable-x11=false
LIBXKBCOMMON_CONF_OPTS += --enable-wayland
endif

$(eval $(meson-package))
