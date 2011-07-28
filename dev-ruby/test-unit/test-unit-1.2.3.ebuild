# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/test-unit/test-unit-1.2.3.ebuild,v 1.3 2011/07/15 17:35:01 mattst88 Exp $

EAPI=2

# This is only useful for Ruby 1.9 for testsuites using the old
# test/unit
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC="docs"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.txt History.txt"

# Disable default binwraps
RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

ruby_add_bdepend "
	doc? ( dev-ruby/hoe )
	test? ( dev-ruby/hoe )"

# Tests need to be verified
RESTRICT=test

DESCRIPTION="Nathaniel Talbott's originial test-unit"
HOMEPAGE="http://test-unit.rubyforge.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ia64 ~mips ~ppc ~sparc ~x86 ~x86-fbsd"
IUSE=""