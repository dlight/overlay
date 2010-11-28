# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit latex-package

MY_PV="${PV/_/-}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Tex classes for ABNT"
HOMEPAGE="http://abntex.codigolivre.org.br/"
SRC_URI="http://codigolivre.org.br/frs/download.php/5337/${MY_P}.tar.gz
	doc? ( http://codigolivre.org.br/frs/download.php/5339/${PN}-doc-${MY_PV}.tar.gz )"

LICENSE="LPPL-1.3c"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="lyx doc"

DEPEND="dev-texlive/texlive-latex
	dev-texlive/texlive-latexrecommended
	lyx? ( app-office/lyx )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${PV%_*}"

src_install() {
	local tex="${D}"/usr/share/texmf
	local lyx="${D}"/usr/share/lyx
	local bin="${D}"/usr/bin

	mkdir -p ${tex} ${lyx} ${bin}

	if ! use lyx; then
		rm -rf lyx
		sed -i 's/install-bin install-lyx/install-bin/' Makefile \
			echo "sed failed."
	fi

	emake TEXDIR=${tex} LYXDIR=${lyx} USRLOCAL=${bin} install

	if use doc; then
		insinto /usr/share/doc/${PF}
		doins compiled.docs/*
	fi
}
