# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/dibbler/dibbler-0.8.0.ebuild,v 1.2 2012/05/15 20:18:10 hwoarang Exp $

EAPI="4"

inherit autotools eutils flag-o-matic toolchain-funcs

DESCRIPTION="Portable DHCPv6 implementation (server, client and relay)"
HOMEPAGE="http://klub.com.pl/dhcpv6/"

SRC_URI="http://klub.com.pl/dhcpv6/dibbler/${P}-src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~mips ~x86"
IUSE="doc"
DEPEND="doc? (
	dev-texlive/texlive-latex
	dev-tex/floatflt )"
RDEPEND=""

DIBBLER_DOCDIR=${S}/doc

src_prepare() {
	# TODO: FIX ME!
	append-ldflags $(no-as-needed)
	sed -i \
		-e "s#CC           ?= gcc#CC           ?= $(tc-getCC)#g" \
		-e "s#CXX          ?= g++#CXX          ?= $(tc-getCXX)#g" \
		Makefile.inc || die "Patching Makefile.inc failed"
	cd "${S}"/poslib
	eautoreconf
}

src_compile() {
	emake -j1
	# devel documentation is broken and users should consult the online
	# version
	# http://klub.com.pl/dhcpv6/doxygen/
	use doc && emake -j1 -C doc/ user
}

src_install() {
	dosbin dibbler-server
	dosbin dibbler-client
	dosbin dibbler-relay
	doman doc/man/dibbler-server.8 doc/man/dibbler-client.8 \
		doc/man/dibbler-relay.8
	dodoc CHANGELOG RELNOTES

	insinto /etc/dibbler
	doins *.conf
	dodir /var/lib/dibbler

	use doc && dodoc ${DIBBLER_DOCDIR}/dibbler-user.pdf

	insinto /etc/init.d
	doins "${FILESDIR}/dibbler-server" "${FILESDIR}/dibbler-client" \
		"${FILESDIR}/dibbler-relay"
	fperms 755 /etc/init.d/dibbler-server
	fperms 755 /etc/init.d/dibbler-client
	fperms 755 /etc/init.d/dibbler-relay
}

pkg_postinst() {
	einfo "Make sure that you modify client.conf, server.conf and/or relay.conf "
	einfo "to suit your needs. They are stored in /etc/dibbler."
}
