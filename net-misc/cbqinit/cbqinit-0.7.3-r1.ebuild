# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/cbqinit/cbqinit-0.7.3-r1.ebuild,v 1.1 2005/11/15 00:47:32 vapier Exp $

inherit eutils

DESCRIPTION="Sets up class-based queue traffic control (QoS) with iproute2"
HOMEPAGE="http://www.sourceforge.net/projects/cbqinit"
SRC_URI="mirror://sourceforge/cbqinit/cbq.init-v${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~mips ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="sys-apps/iproute2"
DEPEND=""

S=${WORKDIR}

src_unpack() {
	cp "${DISTDIR}"/cbq.init-v${PV} "${S}"/cbqinit || die
	grep '^#' cbqinit > README
	epatch "${FILESDIR}"/${P}-gentoo.patch
}

src_install() {
	dosbin cbqinit || die
	newinitd "${FILESDIR}"/rc_cbqinit-r1 cbqinit
	dodoc "${FILESDIR}"/cbq-1280.My_first_shaper.sample README
}