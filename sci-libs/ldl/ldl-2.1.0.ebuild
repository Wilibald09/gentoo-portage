# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-libs/ldl/ldl-2.1.0.ebuild,v 1.1 2012/11/12 02:04:29 bicatali Exp $

EAPI=4

inherit autotools-utils

DESCRIPTION="Simple but educational LDL^T matrix factorization algorithm"
HOMEPAGE="http://www.cise.ufl.edu/research/sparse/ldl"
SRC_URI="http://dev.gentoo.org/~bicatali/distfiles/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86 ~amd64-fbsd ~amd64-linux ~x86-linux ~x86-macos"
IUSE="doc static-libs"

RDEPEND="sci-libs/suitesparseconfig"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	doc? ( virtual/latex-base )"

src_configure() {
	local myeconfargs=(
		$(use_with doc)
	)
	autotools-utils_src_configure
}
