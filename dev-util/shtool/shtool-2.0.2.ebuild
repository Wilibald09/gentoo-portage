# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/shtool/shtool-2.0.2.ebuild,v 1.5 2009/10/12 08:22:01 ssuominen Exp $

DESCRIPTION="A compilation of small but very stable and portable shell scripts into a single shell tool"
HOMEPAGE="http://www.gnu.org/software/shtool/shtool.html"
SRC_URI="mirror://gnu/${PN}/${P}.tar.gz"
#SRC_URI="mirror://gnu/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="ia64 ~ppc sparc x86"
IUSE=""

DEPEND=">=dev-lang/perl-5.6"

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS ChangeLog README THANKS VERSION NEWS RATIONAL
}