# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/lua-mode/lua-mode-20071122.ebuild,v 1.13 2009/12/08 17:11:32 ranger Exp $

inherit elisp

DESCRIPTION="An Emacs major mode for editing Lua scripts"
HOMEPAGE="http://lua-users.org/wiki/LuaEditorSupport"

SRC_URI="http://luaforge.net/tracker/download.php/185/819/2068/227/lua-mode-20100404-r1.el"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86 x86-fbsd"
IUSE=""

SITEFILE="70${PN}-gentoo.el"

src_unpack() { mv "${DISTDIR}/${A}" "${WORKDIR}/lua-mode.el"; }
