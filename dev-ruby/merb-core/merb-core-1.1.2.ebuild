# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/merb-core/merb-core-1.1.2.ebuild,v 1.1 2010/07/03 12:18:56 hollow Exp $

EAPI="2"
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Pocket rocket web framework"
HOMEPAGE="http://merbivore.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend "dev-ruby/bundler
	>=dev-ruby/erubis-2.6.2
	>=dev-ruby/extlib-0.9.13
	>=dev-ruby/mime-types-1.16
	dev-ruby/rack
	dev-ruby/rake"
