# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/pcc-libs/pcc-libs-1.0.1_pre20121112.ebuild,v 1.1 2012/11/12 05:34:05 patrick Exp $

EAPI=2

inherit eutils versionator

DESCRIPTION="pcc compiler support libs"
HOMEPAGE="http://pcc.ludd.ltu.se"

SRC_URI="ftp://pcc.ludd.ltu.se/pub/${PN}/${PN}-${PVR/*_pre/}.tgz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~amd64-fbsd"

IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"
S=${WORKDIR}/${PN}-${PVR/*_pre/}/

src_compile() {
	# not parallel-safe yet
	emake -j1 || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
