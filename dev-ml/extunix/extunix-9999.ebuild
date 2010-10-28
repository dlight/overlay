# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit findlib eutils git

EAPI=3

DESCRIPTION="Thin wrappers for various low-level system api not covered by Unix
module."
HOMEPAGE="https://forge.ocamlcore.org/projects/extunix/"

#SRC_URI=""

EGIT_REPO_URI="http://git.ocamlcore.org/extunix/extunix.git"

RDEPEND=">=dev-lang/ocaml-3.12
         dev-ml/ounit"
DEPEND="${RDEPEND}"

LICENSE=""
SLOT="0"
KEYWORDS="x86"
IUSE=""

src_configure() {
	./configure --prefix /usr --mandir /usr/share/man \
		--infodir /usr/share/info --datadir /usr/share \
		--sysconfdir /etc --localstatedir /var/lib

}

src_compile() {
	emake
}

src_install() {
	findlib_src_install

	emake doc
	dodoc README.txt TODO
	dohtml api.docdir/*
}
