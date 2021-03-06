# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-chemistry/jmol/jmol-12.2.27.ebuild,v 1.3 2012/06/21 14:41:23 je_fro Exp $

EAPI=1
WEBAPP_OPTIONAL="yes"

inherit eutils webapp java-pkg-2 java-ant-2

MY_P="Jmol"

DESCRIPTION="Jmol is a java molecular viever for 3-D chemical structures."
SRC_URI="
	mirror://sourceforge/${PN}/${MY_P}-${PV}-full.tar.gz
	http://dev.gentoo.org/~jlec/distfiles/${PN}-selfSignedCertificate.store.tar"

HOMEPAGE="http://jmol.sourceforge.net/"
KEYWORDS="~x86 ~amd64"
LICENSE="LGPL-2.1"

IUSE="+client-only vhosts"

WEBAPP_MANUAL_SLOT="yes"
SLOT="0"

COMMON_DEP="dev-java/commons-cli
	dev-java/itext:0
	sci-libs/jmol-acme
	sci-libs/vecmath-objectclub
	sci-libs/naga"
RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	dev-java/saxon:6.5
	!client-only? ( ${WEBAPP_DEPEND} )
	${COMMON_DEP}"

pkg_setup() {

	use client-only || webapp_pkg_setup
	java-pkg-2_pkg_setup
}

src_unpack() {

	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}"/${P}-nointl.patch

	rm -v "${S}"/*.jar "${S}"/plugin-jars/*.jar || die
	cd "${S}/jars"

# We still have to use netscape.jar on amd64 until a nice way to include plugin.jar comes along.
	if use amd64; then
		mv -v netscape.jar netscape.tempjar || die "Failed to move netscape.jar."
		rm -v *.jar *.tar.gz || die "Failed to remove jars."
		mv -v netscape.tempjar netscape.jar || die "Failed to move netscape.tempjar."
	fi

	java-pkg_jar-from vecmath-objectclub vecmath-objectclub.jar vecmath1.2-1.14.jar
	java-pkg_jar-from itext iText.jar itext-1.4.5.jar
	java-pkg_jar-from jmol-acme jmol-acme.jar Acme.jar
	java-pkg_jar-from commons-cli-1 commons-cli.jar commons-cli-1.0.jar
	java-pkg_jar-from naga
	java-pkg_jar-from --build-only saxon-6.5 saxon.jar

	mkdir -p "${S}/build/appjars" || die
}

src_compile() {
	# prevent absorbing dep's classes
	eant -Dlibjars.uptodate=true main
}

src_install() {

	java-pkg_dojar build/Jmol.jar
	dohtml -r  build/doc/* || die "Failed to install html docs."
	dodoc *.txt doc/*license* || die "Failed to install licenses."

	java-pkg_dolauncher ${PN} --main org.openscience.jmol.app.Jmol \
		--java_args "-Xmx512m"

	if ! use client-only ; then
		webapp_src_preinst || die "Failed webapp_src_preinst."
		cmd="cp Jmol.js build/Jmol.jar "${D}${MY_HTDOCSDIR}"" ; ${cmd} \
		|| die "${cmd} failed."
		cmd="cp build/JmolApplet*.jar "${D}${MY_HTDOCSDIR}"" ; ${cmd} \
		|| die "${cmd} failed."
		cmd="cp applet.classes "${D}${MY_HTDOCSDIR}"" ; ${cmd} \
		|| die "${cmd} failed."
		cmd="cp -r build/classes/* "${D}${MY_HTDOCSDIR}"" ; ${cmd} \
		|| die "${cmd} failed."
		cmd="cp -r build/appletjars/* "${D}${MY_HTDOCSDIR}"" ; ${cmd} \
		|| die "${cmd} failed."
		cmd="cp "${FILESDIR}"/caffeine.xyz "${D}${MY_HTDOCSDIR}"" ; ${cmd} \
		|| die "${cmd} failed."
		cmd="cp "${FILESDIR}"/index.html "${D}${MY_HTDOCSDIR}"" ; ${cmd} \
		|| die "${cmd} failed."

		webapp_src_install || die "Failed running webapp_src_install"
	fi
}

pkg_postinst() {

	if ! use client-only ; then
		webapp_pkg_postinst || die "webapp_pkg_postinst failed"
	fi

}

pkg_prerm() {

	if ! use client-only ; then
		webapp_pkg_prerm || die "webapp_pkg_prerm failed"
	fi

}
