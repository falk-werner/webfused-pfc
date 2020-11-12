# -*-makefile-*-
#
# Copyright (C) 2020 by Falk Werner <https://github.com/falk-werner>
#

HOST_PACKAGES-$(PTXCONF_HOST_SYSTEM_NINJA) += host-system-ninja
HOST_SYSTEM_NINJA_LICENSE := ignore

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/host-system-ninja.prepare:
	@$(call targetinfo)
	@echo "Checking for ninja..."
	@ninja --version 2>&1 >/dev/null || \
		ptxd_bailout "'ninja' not found! Please install.";
	@echo
	@$(call touch)

# vim: syntax=make
