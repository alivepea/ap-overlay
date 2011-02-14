# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: Code snippets engine for Vim, with snippets library. "
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2611"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=14395 -> ${PF}.tgz"
LICENSE=""
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}"

VIM_PLUGIN_HELPFILES="gxpt.snippet.tutor xpt.snippet.syn xpt-function xpt.api xptemplate"
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES="filetype"

