# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/cunit/cunit-2.1-r1.ebuild,v 1.7 2011/04/10 02:59:58 abcd Exp $

EAPI=3
inherit eutils autotools

MY_PN='CUnit'
MY_PV="${PV}-0"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="CUnit - C Unit Test Framework"
SRC_URI="mirror://sourceforge/cunit/${MY_P}-src.tar.gz"
HOMEPAGE="http://cunit.sourceforge.net"

DEPEND=""
SLOT="0"
LICENSE="LGPL-2"
KEYWORDS="alpha amd64 hppa ia64 ~mips ppc ppc64 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos"
IUSE=""

S=${WORKDIR}/${MY_P}

src_prepare() {
	sed -e "/^docdir/d" -i doc/Makefile.am
	sed -e '/^dochdrdir/{s:$(prefix)/doc/@PACKAGE@:$(docdir):}' \
		-i doc/headers/Makefile.am
	eautoreconf
}

src_configure() {
	econf --docdir="${EPREFIX}"/usr/share/doc/${PF}
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS NEWS README ChangeLog
}