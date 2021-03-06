# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/eclass/autotools-multilib.eclass,v 1.9 2013/02/10 11:44:00 mgorny Exp $

# @ECLASS: autotools-multilib.eclass
# @MAINTAINER:
# Michał Górny <mgorny@gentoo.org>
# @BLURB: autotools-utils wrapper for multilib builds
# @DESCRIPTION:
# The autotools-multilib.eclass is an autotools-utils.eclass(5) wrapper
# introducing support for building for more than one ABI (multilib).
#
# Inheriting this eclass sets IUSE=multilib and exports autotools-utils
# phase function wrappers which build the package for each supported ABI
# if the flag is enabled. Otherwise, it works like regular
# autotools-utils.
#
# Note that the multilib support requires out-of-source builds to be
# enabled. Thus, it is impossible to use AUTOTOOLS_IN_SOURCE_BUILD with
# it.

# EAPI=5 is required for meaningful MULTILIB_USEDEP.
case ${EAPI:-0} in
	5) ;;
	*) die "EAPI=${EAPI} is not supported" ;;
esac

if [[ ${AUTOTOOLS_IN_SOURCE_BUILD} ]]; then
	die "${ECLASS}: multilib support requires out-of-source builds."
fi

inherit autotools-utils multilib-build

EXPORT_FUNCTIONS src_configure src_compile src_test src_install

autotools-multilib_src_configure() {
	multilib_parallel_foreach_abi autotools-utils_src_configure
}

autotools-multilib_src_compile() {
	multilib_foreach_abi autotools-utils_src_compile
}

autotools-multilib_src_test() {
	multilib_foreach_abi autotools-utils_src_test
}

autotools-multilib_src_install() {
	autotools-multilib_secure_install() {
		autotools-utils_src_install

		# Make sure all headers are the same for each ABI.
		multilib_check_headers
	}

	multilib_foreach_abi autotools-multilib_secure_install
}
