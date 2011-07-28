# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-plugins/wmpasman/wmpasman-0.8.4.1.ebuild,v 1.10 2011/03/28 15:10:53 nirbheek Exp $

EAPI="1"

DESCRIPTION="Password storage/retrieval in a dockapp"
HOMEPAGE="http://sourceforge.net/projects/wmpasman/"
SRC_URI="mirror://sourceforge/wmpasman/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc ~sparc x86"
IUSE=""

RDEPEND=">=x11-libs/gtk+-2.4.1:2
	>=app-crypt/mhash-0.9.1
	>=app-crypt/mcrypt-2.6.4"
DEPEND="${RDEPEND}
	>=sys-apps/sed-4
	>=dev-util/pkgconfig-0.20
	>=x11-libs/libXpm-3.5.5"

src_unpack() {
	unpack ${A}
	cd "${S}"

	# Solves compile error about undefined exit - Bug 140857
	sed -i -e '/#include <stdio.h>/ { p ; s/stdio/stdlib/ }' wmgeneral/wmgeneral-gtk.c
}

src_install() {
	einstall || die "einstall failed."
	dodoc BUGS ChangeLog README TODO WARNINGS
}

pkg_postinst() {
	ewarn "Please read the WARNINGS file."
}