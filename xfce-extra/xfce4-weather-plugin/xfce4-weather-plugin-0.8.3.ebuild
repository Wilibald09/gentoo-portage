# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-extra/xfce4-weather-plugin/xfce4-weather-plugin-0.8.3.ebuild,v 1.1 2013/02/20 08:58:49 ssuominen Exp $

EAPI=5
inherit xfconf

DESCRIPTION="A weather plug-in for the Xfce desktop environment"
HOMEPAGE="http://goodies.xfce.org/projects/panel-plugins/xfce4-weather-plugin"
SRC_URI="mirror://xfce/src/panel-plugins/${PN}/${PV%.*}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86"
IUSE="debug udev"

RDEPEND=">=dev-libs/glib-2.20
	dev-libs/libxml2
	>=net-libs/libsoup-2.26
	>=x11-libs/gtk+-2.14:2
	>=xfce-base/libxfce4ui-4.10
	>=xfce-base/libxfce4util-4.10
	>=xfce-base/xfce4-panel-4.10
	udev? ( >=sys-power/upower-0.9.19 )"
DEPEND="${RDEPEND}
	dev-util/intltool
	virtual/pkgconfig"

pkg_setup() {
	# For GEONAMES_USERNAME, read README file and ask ssuominen@!
	XFCONF=(
		$(use_enable udev upower)
		$(xfconf_use_debug)
		GEONAMES_USERNAME=Gentoo
		)

	DOCS=( AUTHORS ChangeLog NEWS README TODO )
}
