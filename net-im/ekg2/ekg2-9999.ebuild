# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-im/ekg2/ekg2-9999.ebuild,v 1.5 2012/12/17 00:37:17 mgorny Exp $

EAPI=5

#if LIVE
AUTOTOOLS_AUTORECONF=yes
EGIT_REPO_URI="git://github.com/leafnode/${PN}.git
	http://github.com/leafnode/${PN}.git"

inherit git-2
#endif

PYTHON_COMPAT=( python{2_5,2_6,2_7} )
inherit autotools-utils python-single-r1

DESCRIPTION="Text-based, multi-protocol instant messenger"
HOMEPAGE="http://www.ekg2.org"
SRC_URI="http://pl.ekg2.org/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="gadu gpm gpg gtk inotify minimal ncurses nls nntp openssl
	perl python readline rss spell sqlite sqlite2 ssl xmpp unicode zlib"

RDEPEND="dev-libs/glib:2
	gadu? ( net-libs/libgadu )
	gpg? ( app-crypt/gpgme )
	gtk? ( x11-libs/gtk+:2 )
	nls? ( virtual/libintl )
	openssl? ( dev-libs/openssl )
	perl? ( dev-lang/perl )
	python? ( ${PYTHON_DEPS} )
	readline? ( sys-libs/readline )
	rss? ( dev-libs/expat )
	ssl? ( net-libs/gnutls )
	xmpp? ( dev-libs/expat )
	zlib? ( sys-libs/zlib )

	ncurses? ( sys-libs/ncurses[unicode=]
		gpm? ( sys-libs/gpm )
		spell? ( app-text/aspell ) )
	sqlite? (
		!sqlite2? ( dev-db/sqlite:3 )
		sqlite2? ( dev-db/sqlite:0 ) )"

DEPEND="${RDEPEND}
	sys-devel/gettext"

DOCS=(
	AUTHORS README.md docs/README docs/TODO
	docs/events.txt docs/mouse.txt docs/sim.txt docs/voip.txt
	docs/themes.txt docs/themes-en.txt
	docs/ui-ncurses.txt docs/ui-ncurses-en.txt
)

#if LIVE
KEYWORDS=
SRC_URI=
#endif

pkg_pretend() {
	if ! use gtk && ! use ncurses && ! use readline; then
		ewarn 'ekg2 is being compiled without any frontend, you should consider'
		ewarn 'enabling at least one of following USEflags:'
		ewarn '  gtk, ncurses, readline.'
	fi
}

src_configure() {
	myeconfargs=(
		# direct plugin references
		$(use_enable gadu gg)
		$(use_enable gpg)
		$(use_enable gtk)
		$(use_enable ncurses)
		$(use_enable nntp)
		$(use_enable openssl sim)
		$(use_enable perl)
		$(use_enable python)
		$(use_enable readline)
		$(use_enable rss)
		$(use_enable sqlite logsqlite)
		$(use_enable xmpp jabber)

		$(use_enable !minimal autoresponder)
		$(use_enable !minimal jogger)
		$(use_enable !minimal mail)
		$(use_enable !minimal polchat)
		$(use_enable !minimal rivchat)
		$(use_enable !minimal sms)

		# sqlite switch
		$(use_with !sqlite2 sqlite3)
		$(use_with sqlite2 sqlite)

		# optional deps
		$(use_with gpm)
		$(use_with inotify)
		$(use_with spell aspell)
		$(use_with ssl gnutls)
		$(use_with zlib)

		# other magic
		$(use_enable nls)
		--with-perl-module-build-flags='INSTALLDIRS=vendor'
		--enable-fast-configure
	)
	autotools-utils_src_configure
}
