# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/webkit-gtk/webkit-gtk-1.2.5.ebuild,v 1.4 2010/11/25 07:25:39 grobian Exp $

EAPI="3"

inherit autotools flag-o-matic eutils virtualx

MY_P="webkit-${PV}"
DESCRIPTION="Open source web browser engine"
HOMEPAGE="http://www.webkitgtk.org/"
SRC_URI="http://www.webkitgtk.org/${MY_P}.tar.gz"

LICENSE="LGPL-2 LGPL-2.1 BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~ia64-linux ~x86-linux ~x86-macos"
# geoclue is missing
IUSE="aqua coverage debug doc +gstreamer introspection"

# use sqlite, svg by default
# dependency on >=x11-libs/gtk+-2.13 for gail
# XXX: Quartz patch does not apply
RDEPEND="
	dev-libs/libxml2
	dev-libs/libxslt
	virtual/jpeg
	>=media-libs/libpng-1.4
	x11-libs/cairo
	>=x11-libs/gtk+-2.13[aqua=]
	>=dev-libs/glib-2.21.3
	>=dev-libs/icu-3.8.1-r1
	>=net-libs/libsoup-2.29.90
	>=dev-db/sqlite-3
	>=app-text/enchant-0.22
	>=x11-libs/pango-1.12

	gstreamer? (
		media-libs/gstreamer:0.10
		>=media-libs/gst-plugins-base-0.10.25:0.10 )
	introspection? ( >=dev-libs/gobject-introspection-0.6.2 )"

DEPEND="${RDEPEND}
	>=sys-devel/flex-2.5.33
	sys-devel/gettext
	dev-util/gperf
	dev-util/pkgconfig
	dev-util/gtk-doc-am
	doc? ( >=dev-util/gtk-doc-1.10 )"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	# Don't force -O2
	sed -i 's/-O2//g' "${S}"/configure.ac || die "sed failed"

	# Prevent maintainer mode from being triggered during make
	AT_M4DIR=autotools eautoreconf
}

src_configure() {
	# It doesn't compile on alpha without this in LDFLAGS
	use alpha && append-ldflags "-Wl,--no-relax"

	# Sigbuses on SPARC with mcpu
	use sparc && filter-flags "-mcpu=*" "-mtune=*"

	local myconf

	myconf="
		--disable-introspection
		--disable-web_sockets
		$(use_enable coverage)
		$(use_enable debug)
		$(use_enable gstreamer video)
		$(use_enable introspection)
		$(use aqua && echo "--with-font-backend=pango --with-target=quartz")"
		# Disable web-sockets per bug #326547

	econf ${myconf}
}

src_compile() {
	# Fix sandbox error with USE="introspection"
	# https://bugs.webkit.org/show_bug.cgi?id=35471
	addpredict "$(unset HOME; echo ~)/.local"
	emake || die "Compile failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc WebKit/gtk/{NEWS,ChangeLog} || die "dodoc failed"
}
