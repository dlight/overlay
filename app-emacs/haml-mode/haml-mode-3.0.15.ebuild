# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/lua-mode/lua-mode-20071122.ebuild,v 1.13 2009/12/08 17:11:32 ranger Exp $

inherit elisp

EAPI=2

DESCRIPTION="An Emacs major mode for editing Haml scripts"
HOMEPAGE="http://www.emacswiki.org/emacs/HamlMode"

SRC_URI="http://github.com/nex3/haml-mode/raw/9b71c6a3d55b8d9593ee6e03aa8cf46222aaef07/haml-mode.el
	-> haml-mode-3.0.15.ebuild"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86 x86-fbsd"
IUSE=""

SITEFILE="70${PN}-gentoo.el"

src_unpack() { mv "${DISTDIR}/${A}" "${WORKDIR}/lua-mode.el"; }
