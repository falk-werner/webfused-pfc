# -*-makefile-*-
#
# Copyright (C) by Falk Werner <https://github.com/falk-werner>
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_WEBFUSED) += webfused

#
# Paths and names
#
WEBFUSED_VERSION := 0.5.0
WEBFUSED_MD5     := 48cb4148c4224349e0465b302830c325
WEBFUSED         := webfused-$(WEBFUSED_VERSION)
WEBFUSED_SUFFIX  := tar.gz
WEBFUSED_DIR     := $(BUILDDIR)/$(WEBFUSED)
WEBFUSED_LICENSE := LGPL-3.0-or-later

ifndef PTXCONF_WEBFUSED_LOCAL_SRC
WEBFUSED_URL     := https://github.com/falk-werner/webfused/archive/v$(WEBFUSED_VERSION).$(WEBFUSED_SUFFIX)
WEBFUSED_SOURCE  := $(SRCDIR)/$(WEBFUSED).$(WEBFUSED_SUFFIX)
else
WEBFUSED_URL     := file://$(PTXDIST_WORKSPACE)/local_src/webfused
endif

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(WEBFUSED_SOURCE):
#	@$(call targetinfo)
#	@$(call get, WEBFUSE)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#WEBFUSED_CONF_ENV := $(CROSS_ENV)

#
# meson
#
WEBFUSED_CONF_TOOL := meson
WEBFUSED_CONF_OPT  := $(CROSS_MESON_USR) \
-Dwithout_tests=true \
-Dwithout_userdb=true

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/webfused.targetinstall:
	@$(call targetinfo)
	@$(call install_init , webfused)
	@$(call install_fixup, webfused, PRIORITY   , optional)
	@$(call install_fixup, webfused, SECTION    , base)
	@$(call install_fixup, webfused, AUTHOR     , "Falk Werner <https://github.com/falk-werner>")
	@$(call install_fixup, webfused, DESCRIPTION, missing)

	@$(call install_copy, webfused, 0, 0, 0755, -, /usr/bin/webfused)

	@$(call install_finish, webfused)
	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/webfused.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, WEBFUSED)

# vim: syntax=make



