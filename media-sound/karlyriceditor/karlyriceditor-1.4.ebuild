# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/karlyriceditor/karlyriceditor-1.4.ebuild,v 1.2 2013/02/07 18:45:16 aballier Exp $

EAPI=5

inherit eutils qt4-r2

DESCRIPTION="Application to edit and synchronize lyrics with karaoke songs in various formats"
HOMEPAGE="http://www.ulduzsoft.com/linux/karaoke-lyrics-editor/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-libs/openssl:0
	media-libs/libsdl
	>=virtual/ffmpeg-0.10
	x11-libs/qt-core:4
	x11-libs/qt-gui:4
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
"

PATCHES=(
		"${FILESDIR}/${PN}-1.3-libav.patch"
		"${FILESDIR}/${PN}-1.4-ffmpeg_compat.patch"
		"${FILESDIR}/${PN}-1.4-qmin.patch"
		)

src_install() {
	dodoc Changelog
	dobin bin/${PN}
	doicon packages/${PN}.png
	make_desktop_entry ${PN} 'Karaoke Lyrics Editor'
}
