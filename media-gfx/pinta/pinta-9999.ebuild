# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/pinta/pinta-9999.ebuild,v 1.5 2013/02/07 22:27:30 ulm Exp $

EAPI=4

inherit autotools fdo-mime git-2 mono

DESCRIPTION="Simple Painting for Gtk"
HOMEPAGE="http://pinta-project.com"
SRC_URI=""

EGIT_REPO_URI="git://github.com/PintaProject/Pinta.git"

LICENSE="MIT CC-BY-3.0"
SLOT="0"
KEYWORDS=""
IUSE=""

COMMON_DEPEND="dev-dotnet/atk-sharp:2
	dev-dotnet/gdk-sharp:2
	dev-dotnet/glib-sharp:2
	dev-dotnet/gtk-sharp:2
	dev-dotnet/mono-addins[gtk]
	dev-dotnet/pango-sharp:2
	dev-lang/mono"
RDEPEND="${COMMON_DEPEND}
	x11-libs/cairo[X]
	x11-libs/gdk-pixbuf[X,jpeg,tiff]
	x11-themes/gnome-icon-theme"
DEPEND="${COMMON_DEPEND}
	dev-util/intltool
	virtual/pkgconfig
	sys-devel/gettext"

src_prepare() {
	eautoreconf
	intltoolize --copy --automake --force || die "intltoolize failed"
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
}
