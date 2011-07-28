# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pypam/pypam-0.5.0.ebuild,v 1.3 2010/07/09 22:10:37 arfrever Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils eutils

MY_PN="PyPAM"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python Bindings for PAM (Pluggable Authentication Modules)"
HOMEPAGE="http://www.pangalactic.org/PyPAM"
SRC_URI="http://www.pangalactic.org/PyPAM/${MY_P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=sys-libs/pam-0.64"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

PYTHON_CFLAGS=("2.* + -fno-strict-aliasing")

DOCS="AUTHORS examples/pamtest.py"

src_prepare() {
	distutils_src_prepare

	# Fix a PyObject/PyMEM mixup.
	epatch "${FILESDIR}/${P}-python-2.5.patch"
	# Fix a missing include.
	epatch "${FILESDIR}/${P}-stricter.patch"
}

src_test() {
	testing() {
		PYTHONPATH="$(ls -d build-${PYTHON_ABI}/lib.*)" "$(PYTHON)" tests/PamTest.py
	}
	python_execute_function testing
}