# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/sweep/sweep-0.9.3-r1.ebuild,v 1.1 2011/03/29 07:41:46 radhermit Exp $

EAPI=4

inherit eutils autotools

DESCRIPTION="Audio editor and live playback tool"
HOMEPAGE="http://www.metadecks.org/software/sweep/"
SRC_URI="mirror://sourceforge/sweep/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="alsa ladspa vorbis mp3 libsamplerate speex"

RDEPEND=">=media-libs/libsndfile-1.0
	>=x11-libs/gtk+-2.4.0:2
	>=dev-libs/glib-2.2.0:2
	alsa? ( media-libs/alsa-lib )
	libsamplerate? ( media-libs/libsamplerate )
	speex? ( media-libs/speex )
	vorbis? ( media-libs/libogg media-libs/libvorbis )
	mp3? ( media-libs/libmad )
	ladspa? ( media-libs/ladspa-sdk )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

DOCS=(AUTHORS ChangeLog NEWS README TODO)

LANGS="de el es_ES fr hu it ja pl ru"

for X in ${LANGS}; do
	IUSE="${IUSE} linguas_${X}"
done

src_prepare() {
	epatch "${FILESDIR}"/${P}-configure.patch
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable vorbis oggvorbis) \
		$(use_enable mp3 mad) \
		$(use_enable speex) \
		$(use_enable libsamplerate src) \
		$(use_enable alsa)
}