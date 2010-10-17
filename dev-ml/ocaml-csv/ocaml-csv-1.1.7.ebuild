# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit findlib

EAPI=3

DESCRIPTION="Some ocaml library (ps: has no dependency info)"
HOMEPAGE=""
SRC_URI="http://merjis.com/_file/ocaml-csv-1.1.7.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	findlib_src_install
}
