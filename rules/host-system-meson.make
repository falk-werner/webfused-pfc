# -*-makefile-*-
#
# Copyright (C) 2020 by Falk Werner <https://github.com/falk-werner>
#

HOST_PACKAGES-$(PTXCONF_HOST_SYSTEM_MESON) += host-system-meson
HOST_SYSTEM_MESON_LICENSE := ignore

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/host-system-meson.prepare:
	@$(call targetinfo)
	@echo "Checking for meson..."
	@meson --version 2>&1 >/dev/null || \
		ptxd_bailout "'meson' not found! Please install.";
	@echo
	@$(call touch)

# vim: syntax=make
