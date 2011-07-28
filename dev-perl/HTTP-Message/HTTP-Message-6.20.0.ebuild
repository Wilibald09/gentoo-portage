# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/HTTP-Message/HTTP-Message-6.20.0.ebuild,v 1.7 2011/06/15 05:37:01 naota Exp $

EAPI=3

MODULE_AUTHOR=GAAS
MODULE_VERSION=6.02
inherit perl-module

DESCRIPTION="Base class for Request/Response"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~s390 ~sh ~sparc ~x86 ~ppc-aix ~x86-fbsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RDEPEND="
	!<dev-perl/libwww-perl-6
	virtual/perl-Compress-Raw-Zlib
	>=dev-perl/URI-1.10
	>=virtual/perl-Encode-2.12
	>=dev-perl/HTTP-Date-6.0.0
	>=dev-perl/Encode-Locale-1.0.0
	>=dev-perl/LWP-MediaTypes-6.0.0
	>=dev-perl/HTML-Parser-3.33
	>=virtual/perl-IO-Compress-2.021
	>=virtual/perl-MIME-Base64-2.1
"
DEPEND="${RDEPEND}"

SRC_TEST=online