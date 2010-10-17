# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit findlib

EAPI=3

DESCRIPTION="Some ocaml library (ps: has no dependency info)"
HOMEPAGE=""
SRC_URI="https://forge.ocamlcore.org/frs/download.php/427/calendar-2.03.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	make
	make doc
}

src_install() {
	findlib_src_install || die "AAAaaaaaaa"

	dodoc calendarFAQ-2.6.txt calendar_faq.txt man_date.txt
	dodoc CHANGES README TODO
	dohtml doc/*
}
