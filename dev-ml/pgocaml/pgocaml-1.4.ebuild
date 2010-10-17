# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit findlib eutils

EAPI=3

DESCRIPTION="PG'OCaml provides an interface to PostgreSQL databases for Ocaml
applications."
HOMEPAGE="http://developer.berlios.de/projects/pgocaml/"
SRC_URI="http://download.berlios.de/pgocaml/pgocaml-1.4.tgz
         http://download2.berlios.de/pgocaml/pgocaml-1.4.tgz"

LICENSE=""
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND="dev-ml/extlib dev-ml/pcre-ocaml dev-ml/calendar dev-ml/ocaml-csv"
RDEPEND="${DEPEND}"

src_compile() {
	emake depend || die
	emake || die

	emake doc || die
}

src_install() {
	findlib_src_install

	dodoc *.txt || die
	dohtml html/* || die
}
