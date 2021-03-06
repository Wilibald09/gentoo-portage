# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/jreen/jreen-1.0.5-r1.ebuild,v 1.1 2012/04/05 18:36:12 johu Exp $

EAPI=4

MY_P=lib${PN}\-${PV}

if [[ ${PV} != *9999* ]]; then
	SRC_URI="http://qutim.org/downloads/${MY_P}.tar.bz2 -> ${P}.tar.bz2"
	KEYWORDS="~amd64 ~x86"
else
	GIT_ECLASS="git-2"
	EGIT_REPO_URI="git://github.com/euroelessar/jreen.git"
	KEYWORDS=""
fi

inherit qt4-r2 cmake-utils ${GIT_ECLASS}

DESCRIPTION="Qt XMPP library"
HOMEPAGE="https://github.com/euroelessar/jreen"

LICENSE="GPL-2"
SLOT="0"
IUSE="debug"

DEPEND="
	>=app-crypt/qca-2.0.3
	>=net-dns/libidn-1.20
	>=x11-libs/qt-core-4.6.0:4
	>=x11-libs/qt-gui-4.6.0:4
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-fix-typo.patch"
)

S="${WORKDIR}/${MY_P}"
