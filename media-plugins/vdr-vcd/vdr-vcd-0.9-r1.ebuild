# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/vdr-vcd/vdr-vcd-0.9-r1.ebuild,v 1.1 2012/11/02 19:14:44 hd_brummy Exp $

EAPI="4"

inherit vdr-plugin-2

DESCRIPTION="VDR plugin: play video cds"

HOMEPAGE="http://www.heiligenmann.de/"
SRC_URI=" http://www.heiligenmann.de/vdr/download/${P}.tgz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=media-video/vdr-1.5.9"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}_xgettext.diff"
		"${FILESDIR}/${P}_vdr-1.7.2.diff" )

src_prepare() {
	vdr-plugin-2_src_prepare

	# Patch Makefile, as VDRDIR is no well known variable name
	# to stop spare -I in gcc cmdline
	sed -e 's:$(VDRINC):$(VDRDIR)/include:' -i Makefile
}
