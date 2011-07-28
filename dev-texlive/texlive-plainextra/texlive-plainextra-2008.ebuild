# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-texlive/texlive-plainextra/texlive-plainextra-2008.ebuild,v 1.12 2010/01/15 10:35:45 grobian Exp $

TEXLIVE_MODULE_CONTENTS="cellular colortab fixpdfmag fontch hyplain jsmisc mkpattern newsletr plgraph treetex typespec vertex collection-plainextra
"
TEXLIVE_MODULE_DOC_CONTENTS="cellular.doc colortab.doc fontch.doc hyplain.doc jsmisc.doc mkpattern.doc newsletr.doc plgraph.doc treetex.doc typespec.doc vertex.doc "
TEXLIVE_MODULE_SRC_CONTENTS="jsmisc.source plgraph.source "
inherit texlive-module
DESCRIPTION="TeXLive Plain TeX supplementary packages"

LICENSE="GPL-2 as-is freedist LPPL-1.3 public-domain "
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos"
IUSE=""
DEPEND=">=dev-texlive/texlive-basic-2008
"
RDEPEND="${DEPEND}"