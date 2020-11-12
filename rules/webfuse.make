# -*-makefile-*-
#
# Copyright (C) by Falk Werner <https://github.com/falk-werner>
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_WEBFUSE) += webfuse

#
# Paths and names
#
WEBFUSE_VERSION := 0.6.0
WEBFUSE_MD5     := 8d4697d93a31abe24882539236dc8254
WEBFUSE         := webfuse-$(WEBFUSE_VERSION)
WEBFUSE_SUFFIX  := tar.gz
WEBFUSE_URL     := https://github.com/falk-werner/webfuse/archive/v$(WEBFUSE_VERSION).$(WEBFUSE_SUFFIX)
WEBFUSE_SOURCE  := $(SRCDIR)/$(WEBFUSE).$(WEBFUSE_SUFFIX)
WEBFUSE_DIR     := $(BUILDDIR)/$(WEBFUSE)
WEBFUSE_LICENSE := LGPL-3.0-or-later

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(WEBFUSE_SOURCE):
#	@$(call targetinfo)
#	@$(call get, WEBFUSE)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#WEBFUSE_CONF_ENV := $(CROSS_ENV)

#
# meson
#
WEBFUSE_CONF_TOOL := meson
WEBFUSE_CONF_OPT  := $(CROSS_MESON_USR) -Dwithout_tests=true

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/webfuse.targetinstall:
	@$(call targetinfo)
	@$(call install_init , webfuse)
	@$(call install_fixup, webfuse, PRIORITY   , optional)
	@$(call install_fixup, webfuse, SECTION    , base)
	@$(call install_fixup, webfuse, AUTHOR     , "Falk Werner <https://github.com/falk-werner>")
	@$(call install_fixup, webfuse, DESCRIPTION, missing)

	@$(call install_lib, webfuse, 0, 0, 0644, libwebfuse)

	@$(call install_finish, webfuse)
	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/webfuse.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, WEBFUSE)

# vim: syntax=make



