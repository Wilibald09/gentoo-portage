# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/tremor/tremor-0_pre20120120.ebuild,v 1.7 2013/01/30 00:02:01 aballier Exp $

# svn export http://svn.xiph.org/trunk/Tremor tremor-${PV}

EAPI=4
inherit autotools

DESCRIPTION="A fixed-point version of the Ogg Vorbis decoder (also known as libvorbisidec)"
HOMEPAGE="http://wiki.xiph.org/Tremor"
SRC_URI="mirror://gentoo/${P}.tar.xz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ppc ~ppc64 ~x86 ~amd64-fbsd"
IUSE="static-libs"

RDEPEND="media-libs/libogg"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS="CHANGELOG README"

src_prepare() {
	sed -i -e '/CFLAGS/s:-O2::' configure.in || die
	eautoreconf
}

src_configure() {
	econf $(use_enable static-libs static)
}

src_install() {
	default
	dohtml -r doc/*
	rm -f "${ED}"usr/lib*/lib*.la
}
