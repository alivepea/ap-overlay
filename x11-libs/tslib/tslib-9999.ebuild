# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit git autotools

DESCRIPTION="Touchscreen access library"
HOMEPAGE="https://github.com/kergoth/tslib"
EGIT_REPO_URI="git://github.com/kergoth/${PN}.git"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm"
IUSE="+linear +input +dejitter +variance +pthres debug"

DEPEND=""
RDEPEND="${DEPEND}"


src_prepare() {
	eautoreconf
}

src_configure() {
	econf 	\
		$(use_enable tatung)	\
		$(use_enable crogi)	\
		$(use_enable input)	\
		$(use_enable dejitter)	\
		$(use_enable linear)	\
		$(use_enable variance)	\
		$(use_enable pthres)	\
		$(use_enable debug)|| die "Configure failed"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install"
	dodoc AUTHORS NEWS README
}
