# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/checkbashisms/checkbashisms-2.0.0.5.ebuild,v 1.1 2012/02/21 08:54:08 robbat2 Exp $

EAPI=4

DESCRIPTION="Perl script to check for commonly used bash features not defined by POSIX"
# "checkbaskisms" is not a typo, it's the actual upstream SF project name.
HOMEPAGE="http://sourceforge.net/projects/checkbaskisms/"
SRC_URI="mirror://sourceforge/checkbaskisms/${PV}/${PN} -> ${P}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lang/perl
	virtual/perl-Getopt-Long"

S=${WORKDIR}

src_install() {
	newbin "${DISTDIR}"/${P} ${PN}
}
