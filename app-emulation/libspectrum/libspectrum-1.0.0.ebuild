# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emulation/libspectrum/libspectrum-1.0.0.ebuild,v 1.1 2011/05/02 19:29:50 neurogeek Exp $

EAPI="3"

DESCRIPTION="Spectrum emulation library"
HOMEPAGE="http://fuse-emulator.sourceforge.net/libspectrum.php"
SRC_URI="mirror://sourceforge/fuse-emulator/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="audiofile bzip2 gcrypt zlib"

RDEPEND="zlib? ( sys-libs/zlib )
	bzip2? ( >=app-arch/bzip2-1.0 )
	>=dev-libs/glib-2
	gcrypt? ( dev-libs/libgcrypt )
	audiofile? ( >=media-libs/audiofile-0.2.3 )"
DEPEND="${RDEPEND}
	dev-lang/perl
	dev-util/pkgconfig"

src_configure() {
	econf --with-glib \
	$(use_with zlib zlib) \
	$(use_with bzip2 bzip2) \
	$(use_with audiofile libaudiofile) \
	$(use_with gcrypt libgcrypt) \
	|| die "econf failed!"
}

src_compile() {
	emake || die "Compilation failed"
}

src_install() {
	emake install DESTDIR="${D}" || die "Make install failed"
	dodoc AUTHORS ChangeLog README THANKS doc/*.txt *.txt
	doman doc/libspectrum.3
}