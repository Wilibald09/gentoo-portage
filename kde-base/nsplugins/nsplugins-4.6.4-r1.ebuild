# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/nsplugins/nsplugins-4.6.4-r1.ebuild,v 1.1 2011/06/16 22:38:09 dilfridge Exp $

EAPI=4

KMNAME="kdebase-apps"
inherit kde4-meta

DESCRIPTION="Netscape plugins support for Konqueror."
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

SRC_URI+=" http://dev.gentoo.org/~dilfridge/distfiles/${PN}-4.6.4-update.patch.bz2"

DEPEND="
	x11-libs/libXt
"
RDEPEND="${DEPEND}
	$(add_kdebase_dep konqueror)
"

KMEXTRACTONLY="
	konqueror/settings/
"

PATCHES=(
	"${FILESDIR}/${PN}"-4.6.1-enablefinal.patch
	"${DISTDIR}/${PN}"-4.6.4-update.patch.bz2
)