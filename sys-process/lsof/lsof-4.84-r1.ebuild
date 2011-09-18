# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-process/lsof/lsof-4.84-r1.ebuild,v 1.1 2011/09/17 22:55:12 vapier Exp $

EAPI="2"

inherit flag-o-matic toolchain-funcs

MY_P=${P/-/_}
DESCRIPTION="Lists open files for running Unix processes"
HOMEPAGE="ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/"
SRC_URI="ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/${MY_P}.tar.bz2
	ftp://vic.cc.purdue.edu/pub/tools/unix/lsof/${MY_P}.tar.bz2
	ftp://ftp.cerias.purdue.edu/pub/tools/unix/sysutils/lsof/${MY_P}.tar.bz2"

LICENSE="lsof"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE="ipv6 rpc selinux static"

RDEPEND="rpc? ( net-libs/libtirpc )
	selinux? ( sys-libs/libselinux )"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${MY_P}/${MY_P}_src

src_unpack() {
	unpack ${A}
	cd ${MY_P}
	unpack ./${MY_P}_src.tar
}

src_prepare() {
	epatch "${FILESDIR}"/${PN}-4.84-rpc.patch #370833
	# convert `test -r header.h` into a compile test
	sed -i -r \
		-e 's:test -r \$\{LSOF_INCLUDE\}/([[:alnum:]/._]*):echo "#include <\1>" | ${LSOF_CC} ${LSOF_CFGF} -E - >/dev/null 2>\&1:' \
		-e 's:grep (.*) \$\{LSOF_INCLUDE\}/([[:alnum:]/._]*):echo "#include <\2>" | ${LSOF_CC} ${LSOF_CFGF} -E -P -dD - 2>/dev/null | grep \1:' \
		Configure || die
}

usex() { use $1 && echo ${2:-yes} || echo ${3:-no} ; }
target() { usex kernel_FreeBSD freebsd linux ; }
src_configure() {
	use static && append-ldflags -static

	append-cppflags $(usex rpc "$($(tc-getPKG_CONFIG) libtirpc --cflags)" -DHASNOTRPC)
	append-cppflags $(usex ipv6 -{D,U}HASIPv6)

	export LSOF_CFGL="${CFLAGS} ${LDFLAGS} \
		$(use rpc && $(tc-getPKG_CONFIG) libtirpc --libs)"

	# Set LSOF_INCLUDE to a dummy location so the script doesn't poke
	# around in it and mix /usr/include paths with cross-compile/etc.
	touch .neverInv
	LINUX_HASSELINUX=$(usex selinux y n) \
	LSOF_INCLUDE=${T} \
	LSOF_CC=$(tc-getCC) \
	LSOF_AR="$(tc-getAR) rc" \
	LSOF_RANLIB=$(tc-getRANLIB) \
	LSOF_CFGF="${CFLAGS} ${CPPFLAGS}" \
	./Configure -n $(target) || die
}

src_compile() {
	emake DEBUG="" all || die
}

src_install() {
	dobin lsof || die

	insinto /usr/share/lsof/scripts
	doins scripts/* || die

	doman lsof.8 || die
	dodoc 00*
}
