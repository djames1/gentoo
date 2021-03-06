# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.4.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour" # Broken test-suite: #666812
inherit haskell-cabal

DESCRIPTION="Efficient Arrays"
HOMEPAGE="https://github.com/haskell/vector"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~x86-solaris"
IUSE="+boundschecks internalchecks unsafechecks"

RESTRICT=test # -O2 -g makes tests build hang

RDEPEND=">=dev-haskell/primitive-0.5.0.1:=[profile?] <dev-haskell/primitive-0.7:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
"

PATCHES=("${FILESDIR}"/${P}-primitive-0.6.2.0.patch)

src_prepare() {
	default

	cabal_chdeps \
		"QuickCheck >=  2.7  && < 2.8" "QuickCheck >=  2.7" \
		'base >= 4.3 && < 4.9' 'base >= 4.3' \
		'ghc-prim >= 0.2 && < 0.5' 'ghc-prim >= 0.2'
}

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag boundschecks boundschecks) \
		$(cabal_flag internalchecks internalchecks) \
		$(cabal_flag unsafechecks unsafechecks)
}
