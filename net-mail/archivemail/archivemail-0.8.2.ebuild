# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-mail/archivemail/archivemail-0.8.2.ebuild,v 1.1 2011/06/07 15:25:00 eras Exp $

EAPI="3"
PYTHON_DEPEND="2"

inherit distutils

DESCRIPTION="Tool written in Python for archiving and compressing old email in mailboxes."
HOMEPAGE="http://archivemail.sourceforge.net/"
SRC_URI="mirror://sourceforge/archivemail/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~sparc ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS="examples/* FAQ"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	distutils_src_prepare
	# Fix tests for python-2.7
	sed -i -e 's:\(fp_archive = \)FixedGzipFile:\1gzip.GzipFile:' \
		test_archivemail || die "sed failed"
}

src_test() {
	echo ">>> Test phase: ${CATEGORY}/${PF}"
	"${S}"/test_archivemail || die "test_archivemail failed"
}

src_install() {
	distutils_src_install --install-data=/usr/share
}