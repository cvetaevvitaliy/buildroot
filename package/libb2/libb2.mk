################################################################################
#
# libb2
#
################################################################################

LIBB2_VERSION = 0.98.1
LIBB2_SITE = $(call github,BLAKE2,libb2,v$(LIBB2_VERSION))
LIBB2_LICENSE =  CC0-1.0
LIBB2_LICENSE_FILES = COPYING
LIBB2_INSTALL_STAGING = YES
# From git
LIBB2_AUTORECONF = YES
LIBB2_DEPENDENCIES = host-pkgconf
# disable failing cross-compiling/runtime detection
LIBB2_CONF_ENV = ax_cv_have_ssse3_ex=no
LIBB2_CONF_OPTS = --enable-fat=no --enable-native=no
$(eval $(autotools-package))
