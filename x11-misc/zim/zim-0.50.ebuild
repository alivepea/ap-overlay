# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils eutils fdo-mime virtualx

DESCRIPTION="A desktop wiki"
HOMEPAGE="http://zim-wiki.org"
SRC_URI="http://zim-wiki.org/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="graphviz latex screenshot spell test"

DEPEND=""
RDEPEND="${DEPEND}"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_install () {
	doicon data/${PN}.png || die "doicon failed"
	distutils_src_install --skip-xdg-cmd
}

pkg_postinst() {
	distutils_pkg_postinst
	fdo-mime_desktop_database_update
	xdg-icon-resource install --context mimetypes --size 64 \
		"${ROOT}/usr/share/pixmaps/zim.png" \
		application-x-zim-notebook || die "xdg-icon-resource install failed"
}

pkg_postrm() {
	distutils_pkg_postrm
	fdo-mime_desktop_database_update
	xdg-icon-resource uninstall --context mimetypes --size 64 \
		application-x-zim-notebook || die "xdg-icon-resource uninstall failed"
}
