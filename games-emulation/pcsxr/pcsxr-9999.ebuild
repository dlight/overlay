# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils games autotools subversion

DESCRIPTION="GNU/Linux fork of the discontinued PlayStation emulator PCSX"
HOMEPAGE="http://pcsxr.codeplex.com"
SRC_URI=""
ESVN_REPO_URI="https://pcsxr.svn.codeplex.com/svn/pcsxr"
ESVN_PROJECT="pcsxr"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="alsa opengl"
RESTRICT=""

DEPEND="x11-libs/gtk+:2
	x11-proto/videoproto
	gnome-base/libglade
	alsa? ( media-libs/alsa-lib )
	virtual/libintl
	opengl? ( virtual/opengl
		x11-libs/libXxf86vm )"

RDEPEND="${DEPEND}
	!games-emulation/pcsx
	!games-emulation/pcsx-df
	sys-devel/gettext"

DEPEND="dev-lang/nasm"

src_prepare() {
	# Set up our paths.
	sed -i "s:\${datadir}/pixmaps/:/usr/share/pixmaps/:g" gui/Makefile.am || die
	local i

	for i in $(grep -iRl '${libdir}/games/psemu' .); do
		einfo "Fixing paths in ${i}"
		sed -i "s:\${libdir}/games/psemu:$(games_get_libdir)/psemu/:g" "${i}" || die
	done

	eautoheader
	eautoreconf
}

src_configure() {
	egamesconf --datadir="${GAMES_DATADIR}" \
		$(use_enable alsa) \
		$(use_enable opengl) \
		|| die
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	local libdir=$(games_get_libdir)

	einfo "Relocating libs from redundant dir enclosure"
	mv "${D}${libdir}"/games/psemu "${D}${libdir}"/ || die

	einfo "Relocating share stuff to global DATADIR"
	mv "${D}${GAMES_DATADIR}"/{applications,pixmaps} \
		"${D}${GAMES_DATADIR_BASE}" || die

	dodoc README doc/keys.txt doc/tweaks.txt ChangeLog || die
	prepgamesdirs
}
