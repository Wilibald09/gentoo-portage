# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php/PEAR-Console_Getopt/PEAR-Console_Getopt-1.2.3-r1.ebuild,v 1.6 2011/01/10 18:12:25 xarthisius Exp $

EAPI="2"

MY_PN="${PN/PEAR-/}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Command-line option parser"

LICENSE="PHP-3"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm hppa ~ia64 ppc ppc64 ~s390 ~sh ~sparc x86"
IUSE=""
SRC_URI="http://pear.php.net/get/${MY_P}.tgz"
DEPEND="|| ( <dev-lang/php-5.3[pcre] >=dev-lang/php-5.3 )
		>=dev-php/PEAR-PEAR-1.8.1"
PDEPEND="dev-php/pear"
HOMEPAGE="http://pear.php.net/package/Console_Getopt"

S="${WORKDIR}/${MY_P}"

src_install() {
	insinto /usr/share/php/
	doins -r Console
}