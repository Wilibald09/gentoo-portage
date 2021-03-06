# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/greenlet/greenlet-0.4.0.ebuild,v 1.3 2012/12/06 17:35:30 bicatali Exp $

EAPI=4

SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="2.7-pypy-* *-jython"
DISTUTILS_SRC_TEST=setup.py

inherit distutils

DESCRIPTION="Lightweight in-process concurrent programming"
HOMEPAGE="http://pypi.python.org/pypi/greenlet/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86 ~amd64-linux ~x86-linux"
IUSE="doc"

DEPEND="app-arch/unzip
	dev-python/setuptools
	doc? ( dev-python/sphinx )"
RDEPEND=""

PYTHON_CFLAGS=("2.* + -fno-strict-aliasing")

src_compile() {
	distutils_src_compile
	if use doc ; then
		emake -C doc html
	fi
}

src_install() {
	distutils_src_install
	if use doc; then
		dohtml -r doc/_build/html/
	fi
}
