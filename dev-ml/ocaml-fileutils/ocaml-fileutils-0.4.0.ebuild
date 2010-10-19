# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ml/ocaml-make/ocaml-make-6.29.3.ebuild,v 1.1 2009/06/21 11:54:53 aballier Exp $

inherit findlib eutils autotools

EAPI=3

DESCRIPTION="ocaml-fileutils has functions to manipulate files"
HOMEPAGE="http://le-gall.net/sylvain+violaine/ocaml-fileutils.html"
LICENSE="LGPL-2.1"

DEPEND=""
RDEPEND=">=dev-lang/ocaml-3.06-r1
	>=dev-ml/findlib-0.8
    dev-ml/ocaml-make"
SRC_URI="http://le-gall.net/sylvain+violaine/download/ocaml-fileutils-latest.tar.gz
-> ${P}.tar.gz"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc x86"

#src_compile() {
#	emake
#}

src_prepare() {
	epatch "${FILESDIR}/${PN}-install.patch" || die "QQQ"

	eautoreconf
}

src_install () {
	findlib_src_install
	dodoc README CHANGELOG TODO
	dohtml fileutils.docdir/*
}
