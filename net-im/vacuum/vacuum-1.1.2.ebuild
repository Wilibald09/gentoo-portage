# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-im/vacuum/vacuum-1.1.2.ebuild,v 1.2 2012/03/10 20:20:13 vapier Exp $

EAPI="4"
LANGS="de pl ru uk"

inherit cmake-utils

DESCRIPTION="Qt4 Crossplatform Jabber client."
HOMEPAGE="http://code.google.com/p/vacuum-im"
SRC_URI="http://vacuum-im.googlecode.com/files/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
PLUGINS=" adiummessagestyle annotations autostatus avatars bitsofbinary bookmarks captchaforms chatstates clientinfo commands compress console dataforms datastreamsmanager emoticons filestreamsmanager filetransfer gateways inbandstreams iqauth jabbersearch messagearchiver multiuserchat pepmanager privacylists privatestorage registration remotecontrol rostersearch servicediscovery sessionnegotiation socksstreams vcard xmppuriqueries"
IUSE="${PLUGINS// / +}"
for x in ${LANGS}; do
	IUSE+=" linguas_${x}"
done

REQUIRED_USE="
	annotations? ( privatestorage )
	avatars? ( vcard )
	bookmarks? ( privatestorage )
	captchaforms? ( dataforms )
	commands? ( dataforms )
	datastreamsmanager? ( dataforms )
	filestreamsmanager? ( datastreamsmanager )
	filetransfer? ( filestreamsmanager datastreamsmanager )
	pepmanager? ( servicediscovery )
	registration? ( dataforms )
	remotecontrol? ( commands dataforms )
	sessionnegotiation? ( dataforms )
"

RDEPEND="
	>=x11-libs/qt-core-4.5:4[ssl]
	>=x11-libs/qt-gui-4.5:4
	>=dev-libs/openssl-0.9.8k
	adiummessagestyle? ( >=x11-libs/qt-webkit-4.5:4 )
	net-dns/libidn
	x11-libs/libXScrnSaver
	sys-libs/zlib[minizip]
"
DEPEND="${RDEPEND}"

DOCS="AUTHORS CHANGELOG README TRANSLATORS"

src_prepare() {
	# Force usage of system libraries
	rm -rf src/thirdparty/{idn,minizip,zlib}

	epatch "${FILESDIR}"/${PN}-1.1.1-zlib.patch
}

src_configure() {
	# linguas
	local langs="none;" x
	for x in ${LANGS}; do
		use linguas_${x} && langs+="${x};"
	done

	local mycmakeargs=(
		-DINSTALL_LIB_DIR="$(get_libdir)"
		-DINSTALL_SDK=ON
		-DLANGS="${langs}"
		-DINSTALL_DOCS=OFF
		-DFORCE_BUNDLED_MINIZIP=OFF
	)

	for x in ${PLUGINS}; do
		mycmakeargs+=( "$(cmake-utils_use ${x} PLUGIN_${x})" )
	done

	cmake-utils_src_configure
}
