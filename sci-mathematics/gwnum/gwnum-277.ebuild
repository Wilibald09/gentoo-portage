# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-mathematics/gwnum/gwnum-277.ebuild,v 1.2 2012/11/28 08:19:45 patrick Exp $

EAPI=4
DESCRIPTION="George Woltman's GWNUM library"
HOMEPAGE="http://www.mersenne.org/freesoft/"
# Sourcecode split out from prime95, we don't need the full lib
SRC_URI="http://gentooexperimental.org/~patrick/${P}.tar.bz2"

inherit eutils

LICENSE="as-is" # No explicit license info, but some files have as-is
SLOT="0"
# Need to test if it actually compiles on x86
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	# makefile doesn't return zero? || die fails :(
	use amd64 && emake -f make64
	use x86 && emake
}

src_install() {
	mkdir "${D}/usr/lib" -p
	cp gwnum.a gwnum.lib "${D}/usr/lib" || die
	mkdir "${D}/usr/include" -p
	cp *.h "${D}/usr/include" || die
}
