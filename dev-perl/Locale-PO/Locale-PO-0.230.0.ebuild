# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Locale-PO/Locale-PO-0.230.0.ebuild,v 1.1 2013/02/10 09:51:08 tove Exp $

EAPI=5

MODULE_AUTHOR=COSIMO
MODULE_VERSION=0.23
inherit perl-module

DESCRIPTION="Object-oriented interface to gettext po-file entries"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE=""

RDEPEND="sys-devel/gettext
	dev-perl/File-Slurp"
DEPEND="${RDEPEND}"

SRC_TEST="do"
