# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils

DESCRIPTION="A simulator for Conway's Game of Life and other cellular automata."
HOMEPAGE="http://golly.sourceforge.net/"
SRC_URI="mirror://sourceforge/golly/${P}-src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/${P}-src"

RDEPEND="=dev-lang/perl-5*[ithreads] dev-lang/python:2.5 x11-libs/wxGTK:2.8"
DEPEND="${RDEPEND}"

src_prepare() {
	# Fix linker flags to work with Perl 5.10.1:
	epatch ${FILESDIR}/perl-ldopts.patch

	# Fix installing data files into a different directory than binaries:
	epatch ${FILESDIR}/separate-data-directory.patch

	# Fix Python symbol names on AMD64:
	epatch ${FILESDIR}/python-amd64.patch

	# Insert user-specified compiler flags into Makefile:
	sed -i -e "s/-O5/${CXXFLAGS}/" makefile-gtk
	sed -i -e "s/^LDFLAGS =/\\0 ${LDFLAGS} /" makefile-gtk

	# Get rid of .DS_Store and other stuff that should not be installed:
	find . -name .\* -delete
	find Scripts/Python -name \*.pyc -delete
}

src_compile() {
	emake -f makefile-gtk || die "emake failed"
}

src_install() {
	insinto /usr/bin
	dobin golly bgolly RuleTableToTree || die "can't install binaries"

	insinto /usr/share/golly
	doins -r README Help Patterns Scripts Rules || die "can't install data"
}
