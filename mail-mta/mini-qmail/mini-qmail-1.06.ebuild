# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/mail-mta/mini-qmail/mini-qmail-1.06.ebuild,v 1.3 2011/03/28 08:46:35 eras Exp $

GENQMAIL_PV=20080406

inherit eutils qmail

DESCRIPTION="a small null client that forwards mail via QMQP to a full qmail server"
HOMEPAGE="
	http://netqmail.org
	http://cr.yp.to/qmail/mini.html
	http://qmail.org
"
SRC_URI="mirror://qmail/netqmail-${PV}.tar.gz
	http://dev.gentoo.org/~hollow/distfiles/${GENQMAIL_F}"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~mips ~ppc ~sparc ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	!mail-mta/courier
	!mail-mta/esmtp
	!mail-mta/exim
	!mail-mta/msmtp
	!mail-mta/nbsmtp
	!mail-mta/netqmail
	!mail-mta/nullmailer
	!mail-mta/postfix
	!mail-mta/qmail-ldap
	!mail-mta/sendmail
	!mail-mta/ssmtp
	${DEPEND}
	"

S="${WORKDIR}"/netqmail-${PV}

src_unpack() {
	genqmail_src_unpack

	unpack netqmail-${PV}.tar.gz
	cd "${S}"

	epatch "${FILESDIR}"/${PV}-exit.patch

	ht_fix_file Makefile*

	qmail_src_postunpack
}

src_compile() {
	qmail_src_compile
}

qmail_base_install_hook() {
	dosym qmail-qmqpc "${QMAIL_HOME}"/bin/qmail-queue
	exeinto "${QMAIL_HOME}"/bin
	doexe "${FILESDIR}"/config-mini
}

src_install() {
	qmail_base_install
	qmail_man_install
	qmail_sendmail_install
}