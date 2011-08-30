# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/tinynotify-send/tinynotify-send-1.0.0.ebuild,v 1.1 2011/08/29 22:23:48 mgorny Exp $

EAPI=4
inherit autotools-utils

DESCRIPTION="A notification sending utility (using libtinynotify)"
HOMEPAGE="https://github.com/mgorny/tinynotify-send/"
SRC_URI="http://cloud.github.com/downloads/mgorny/${PN}/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="symlink"

RDEPEND="x11-libs/libtinynotify
	~x11-libs/libtinynotify-cli-${PV}
	symlink? ( !x11-libs/libnotify )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

DOCS=( README )

src_configure() {
	myeconfargs=(
		--disable-library
		--enable-regular
		--disable-system-wide
		--with-system-wide-exec=/usr/bin/sw-notify-send
	)

	autotools-utils_src_configure
}

src_install() {
	autotools-utils_src_install

	use symlink && dosym tinynotify-send /usr/bin/notify-send
}