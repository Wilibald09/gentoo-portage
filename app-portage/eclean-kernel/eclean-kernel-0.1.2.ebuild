# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-portage/eclean-kernel/eclean-kernel-0.1.2.ebuild,v 1.2 2011/11/02 17:46:41 mgorny Exp $

EAPI=4
PYTHON_DEPEND='2:2.6 3:3.2'
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS='2.4 2.5 3.1'

inherit base distutils

DESCRIPTION="Remove outdated built kernels"
HOMEPAGE="https://github.com/mgorny/eclean-kernel/"
SRC_URI="mirror://github/mgorny/${PN}/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

PYTHON_MODNAME=ecleankernel

src_prepare() {
	base_src_prepare
	distutils_src_prepare
}
