# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/razorqt-base/razorqt-libs/razorqt-libs-0.5.2.ebuild,v 1.1 2013/01/19 13:53:41 yngwin Exp $

EAPI=4
inherit cmake-utils

DESCRIPTION="Common libraries for the Razor-qt desktop environment"
HOMEPAGE="http://razor-qt.org/"

if [[ ${PV} = *9999* ]]; then
	inherit git-2
	EGIT_REPO_URI="git://github.com/Razor-qt/razor-qt.git"
	EGIT_BRANCH="master"
	KEYWORDS=""
else
	SRC_URI="http://www.razor-qt.org/downloads/files/razorqt-${PV}.tar.bz2"
	KEYWORDS="~amd64 ~ppc ~x86"
	S="${WORKDIR}/razorqt-${PV}"
fi

LICENSE="GPL-2 LGPL-2.1+"
SLOT="0"
IUSE=""

DEPEND="razorqt-base/libqtxdg
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXfixes
	x11-libs/libXrender
	x11-libs/qt-core:4
	x11-libs/qt-dbus:4
	x11-libs/qt-gui:4
	!<razorqt-base/razorqt-meta-0.5.0
	!x11-wm/razorqt"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DSPLIT_BUILD=On
		-DMODULE_LIBRAZORQT=On
		-DMODULE_LIBRAZORQXT=On
		-DMODULE_LIBRAZORMOUNT=On
		-DMODULE_ABOUT=On
		-DMODULE_X11INFO=On
	)
	cmake-utils_src_configure
}
