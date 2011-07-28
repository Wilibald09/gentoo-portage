# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/twill/twill-0.9.ebuild,v 1.3 2011/06/08 16:15:13 xarthisius Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

MY_PV="${PV/_beta/b}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Simple scripting language for web browsing with Python API."
HOMEPAGE="http://twill.idyll.org/"
SRC_URI="http://darcs.idyll.org/~t/projects/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="doc"

S="${WORKDIR}/${MY_P}"

src_test() {
	elog "Testing disabled due to sandbox problems opening"
	elog "a port on a server. Unpack the ebuild and run the"
	elog "tests manually with 'nosetests' (dev-python/nose)"
	elog "in the unpacked directory."
}

src_install() {
	distutils_src_install

	if use doc; then
		dodir /usr/share/doc/${PF}/examples
		cp -R doc/* "${D}"/usr/share/doc/${PF}/
		cp examples/* "${D}"/usr/share/doc/${PF}/examples/
	fi
}