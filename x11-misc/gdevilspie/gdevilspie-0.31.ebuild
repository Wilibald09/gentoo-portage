# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/gdevilspie/gdevilspie-0.31.ebuild,v 1.5 2011/04/11 20:19:08 arfrever Exp $

EAPI=3
PYTHON_DEPEND="2"

inherit distutils

DESCRIPTION="A user friendly interface to the devilspie window matching daemon, to create rules easily."
HOMEPAGE="http://code.google.com/p/gdevilspie/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/pygtk:2
	dev-python/libwnck-python
	x11-misc/devilspie"

PYTHON_MODNAME="gDevilspie"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	sed -i -e "s:doc/gdevilspie:doc/${PF}:" setup.py || die
	distutils_src_prepare
}