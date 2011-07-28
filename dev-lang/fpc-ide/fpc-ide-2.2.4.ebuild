# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/fpc-ide/fpc-ide-2.2.4.ebuild,v 1.3 2009/06/25 20:37:52 truedfx Exp $

S="${WORKDIR}/fpcbuild-${PV}/fpcsrc/ide"

HOMEPAGE="http://www.freepascal.org/"
DESCRIPTION="Free Pascal Compiler Integrated Development Environment"
SRC_URI="mirror://sourceforge/freepascal/fpcbuild-${PV}.tar.gz"

SLOT="0"
LICENSE="GPL-2 LGPL-2.1 LGPL-2.1-FPC"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

DEPEND="~dev-lang/fpc-${PV}"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A} || die "Unpacking ${A} failed!"

	find "${WORKDIR}" -name Makefile -exec sed -i -e 's/ -Xs / /g' {} + || die

	# Use default configuration (minus stripping) unless specifically requested otherwise
	if ! test ${PPC_CONFIG_PATH+set}; then
		local FPCVER=$(fpc -iV)
		export PPC_CONFIG_PATH="${WORKDIR}"
		sed -e 's/^FPBIN=/#&/' /usr/lib/fpc/${FPCVER}/samplecfg |
			sh -s /usr/lib/fpc/${FPCVER} "${PPC_CONFIG_PATH}" || die
		sed -i -e '/^-Xs/d' "${PPC_CONFIG_PATH}"/fpc.cfg || die
	fi
}

src_compile() {
	emake -j1 || die "make failed"
}

src_install() {
	emake -j1 INSTALL_PREFIX="${D}"usr install || die "make install failed"
}

pkg_postinst() {
	einfo "To read the documentation, enable the doc USE flag for dev-lang/fpc,"
	einfo "and add /usr/share/doc/fpc-${PV}/fpctoc.htx to the Help Files list."
}