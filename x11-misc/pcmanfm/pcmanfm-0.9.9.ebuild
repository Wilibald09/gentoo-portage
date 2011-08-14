# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/pcmanfm/pcmanfm-0.9.9.ebuild,v 1.1 2011/08/10 11:30:06 hwoarang Exp $

EAPI=4

inherit fdo-mime

DESCRIPTION="Fast lightweight tabbed filemanager"
HOMEPAGE="http://pcmanfm.sourceforge.net/"
SRC_URI="http://dev.gentoo.org/~hwoarang/distfiles/${P}.tar.gz"

KEYWORDS="~alpha ~amd64 ~arm ~ppc ~x86 ~x86-linux"
LICENSE="GPL-2"
SLOT="0"
IUSE="debug"

COMMON_DEPEND=">=dev-libs/glib-2.18:2
	>=x11-libs/gtk+-2.22.1:2
	>=lxde-base/menu-cache-0.3.2
	>=x11-libs/libfm-0.1.15_pre20110614"
RDEPEND="${COMMON_DEPEND}
	virtual/eject
	virtual/freedesktop-icon-theme"
DEPEND="${COMMON_DEPEND}
	>=dev-util/intltool-0.40
	dev-util/pkgconfig
	sys-devel/gettext"

src_prepare() {
	# Fix desktop icons
	sed -i -e "/MimeType/s:=.*normal;:=:" "${S}"/data/${PN}.desktop \
		|| die "failed to fix desktop icon"
}

src_configure() {
	econf \
		--sysconfdir="${EPREFIX}/etc" \
		$(use_enable debug)
}

pkg_postinst() {
	fdo-mime_desktop_database_update

	elog 'PCmanFM can optionally support the menu://applications/ location.'
	elog 'You should install lxde-base/lxmenu-data for that	functionality.'
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}