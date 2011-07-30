# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/redland-bindings/redland-bindings-1.0.13.1.ebuild,v 1.1 2011/07/29 11:14:04 ssuominen Exp $

EAPI=3
PYTHON_DEPEND="python? 2:2.7"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.* *-jython"

inherit multilib python

DESCRIPTION="Language bindings for Redland"
HOMEPAGE="http://librdf.org/bindings/"
SRC_URI="http://download.librdf.org/source/${P}.tar.gz"

LICENSE="Apache-2.0 GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~x86-linux ~ppc-macos"
IUSE="lua perl python php ruby"

RDEPEND=">=dev-libs/redland-1.0.10-r2
	lua? ( >=dev-lang/lua-5.1 )
	perl? ( dev-lang/perl )
	php? ( dev-lang/php )
	ruby? ( dev-lang/ruby dev-ruby/log4r )"
DEPEND="${RDEPEND}
	>=dev-lang/swig-1.3.26
	dev-util/pkgconfig
	sys-apps/sed"

pkg_setup() {
	use python && python_pkg_setup
}

src_configure() {
	econf \
		--disable-dependency-tracking \
		$(use_with lua) \
		$(use_with perl) \
		$(use_with python) \
		$(use_with php) \
		$(use_with ruby)

	# Python bindings are built/tested/installed manually.
	sed -e "/^SUBDIRS =/s/ python//" -i Makefile
}

src_compile() {
	default

	if use python; then
		python_copy_sources python

		building() {
			emake \
				PYTHON_INCLUDES="-I$(python_get_includedir)" \
				pythondir="$(python_get_sitedir)"
		}
		python_execute_function -s --source-dir python building
	fi
}

src_test() {
	default

	if use python; then
		testing() {
			emake \
				PYTHON="$(PYTHON)" \
				check
		}
		python_execute_function -s --source-dir python testing
	fi
}

src_install() {
	emake DESTDIR="${D}" INSTALLDIRS=vendor luadir=/usr/$(get_libdir)/lua/5.1 install || die

	if use perl; then
		find "${ED}" -type f -name perllocal.pod -delete
		find "${ED}" -depth -mindepth 1 -type d -empty -delete
	fi

	if use python; then
		installation() {
			emake \
				DESTDIR="${D}" \
				pythondir="$(python_get_sitedir)" \
				install
		}
		python_execute_function -s --source-dir python installation
	fi

	dodoc AUTHORS ChangeLog NEWS README TODO
	dohtml {NEWS,README,RELEASE,TODO}.html
}

pkg_postinst() {
	use python && python_mod_optimize RDF.py
}

pkg_postrm() {
	use python && python_mod_cleanup RDF.py
}