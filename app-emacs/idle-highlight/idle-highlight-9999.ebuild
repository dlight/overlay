# ahm

inherit elisp

DESCRIPTION="Highlight the word the point is on"
HOMEPAGE="http://www.emacswiki.org/cgi-bin/wiki/IdleHighlight"

SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86 x86-fbsd"
IUSE=""

SITEFILE="70${PN}-gentoo.el"

URL="http://github.com/technomancy/dotfiles/raw/master/.emacs.old/idle-highlight.el"

src_unpack() {
	wget "${URL}"
}
