# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-texlive/texlive-documentation-base/texlive-documentation-base-2008.ebuild,v 1.12 2010/01/15 10:21:41 grobian Exp $

TEXLIVE_MODULE_CONTENTS="texlive-common texlive-en collection-documentation-base
"
TEXLIVE_MODULE_DOC_CONTENTS="texlive-en.doc "
TEXLIVE_MODULE_SRC_CONTENTS="texlive-common.source texlive-en.source "
inherit texlive-module
DESCRIPTION="TeXLive TeX Live documentation"

LICENSE="GPL-2 "
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"