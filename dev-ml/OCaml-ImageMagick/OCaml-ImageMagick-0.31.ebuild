# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit findlib eutils

EAPI=3

DESCRIPTION="ImageMagick methods to Objective Caml"
HOMEPAGE="http://www.linux-nantes.org/~fmonnier/OCaml/ImageMagick/"
SRC_URI="http://www.linux-nantes.org/~fmonnier/OCaml/ImageMagick/ImageMagick/${P}.tgz"

LICENSE=""
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND="dev-lang/ocaml
        media-gfx/imagemagick"
RDEPEND="${DEPEND}"

src_compile() {
	emake
	emake doc
}

src_prepare() {
	epatch "${FILESDIR}/${PN}-install.patch" || die "Risos"
}

src_install() {
	findlib_src_install

	dodoc README.txt examples/*
	dohtml doc/magick/html/*
}
