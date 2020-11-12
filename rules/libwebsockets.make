# -*-makefile-*-
#
# Copyright (C) 2010 - 2020 Andy Green <andy@warmcat.com>
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_LIBWEBSOCKETS) += libwebsockets

#
# Paths and names
#
LIBWEBSOCKETS_VERSION := 4.1.4
LIBWEBSOCKETS_MD5     := 88c38a9382b04cef45c6477bd2b86d5a
LIBWEBSOCKETS         := libwebsockets-$(LIBWEBSOCKETS_VERSION)
LIBWEBSOCKETS_SUFFIX  := tar.gz
LIBWEBSOCKETS_URL     := https://github.com/warmcat/libwebsockets/archive/v$(LIBWEBSOCKETS_VERSION).$(LIBWEBSOCKETS_SUFFIX)
LIBWEBSOCKETS_SOURCE  := $(SRCDIR)/$(LIBWEBSOCKETS).$(LIBWEBSOCKETS_SUFFIX)
LIBWEBSOCKETS_DIR     := $(BUILDDIR)/$(LIBWEBSOCKETS)
LIBWEBSOCKETS_LICENSE := MIT

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(LIBWEBSOCKETS_SOURCE):
#	@$(call targetinfo)
#	@$(call get, LIBWEBSOCKETS)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

LIBWEBSOCKETS_CONF_ENV := $(CROSS_ENV)

#
# cmake
#
LIBWEBSOCKETS_CONF_TOOL := cmake
LIBWEBSOCKETS_CONF_OPT  := $(CROSS_CMAKE_USR)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/libwebsockets.targetinstall:
	@$(call targetinstall)
	@$(call install_init, libwebsockets)
	@$(call install_fixup, libwebsockets, PRIORITY, optional)
	@$(call install_fixup, libwebsockets, SECTION , base)
	@$(call install_fixup, libwebsockets, AUTHOR  , "Andy Green <andy@warmcat.com>")
	@$(call install_fixup, libwebsockets, DESCRIPTION, missing)

	@$(call install_lib, libwebsockets, 0, 0, 0644, libwebsockets)

	@$(call install_finish, libwebsockets)
	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/libwebsockets.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, LIBWEBSOCKETS)


# vim: syntax=make

