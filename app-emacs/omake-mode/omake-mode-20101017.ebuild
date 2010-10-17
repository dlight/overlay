# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/lua-mode/lua-mode-20071122.ebuild,v 1.13 2009/12/08 17:11:32 ranger Exp $

inherit elisp

EAPI="2"

DESCRIPTION="An Emacs major mode for editing OMake build files"
HOMEPAGE="http://omake.metaprl.org"

SRC_URI="http://bitbucket.org/camlspotter/omake-mode/raw/473f704a5887/omake-mode.el
-> ${P}.el"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86 x86-fbsd"
IUSE=""

SITEFILE="70${PN}-gentoo.el"

src_unpack() { mv "${DISTDIR}/${A}" "${WORKDIR}/${PN}.el"; }
