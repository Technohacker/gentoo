# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 meson

DESCRIPTION="OpenGL audio spectrum visualizer"
HOMEPAGE="https://github.com/jarcode-foss/glava"
EGIT_REPO_URI="https://github.com/jarcode-foss/glava"

LICENSE="GPL-3"
SLOT="0"
IUSE="config-tool obs"

DEPEND="
	x11-base/xorg-server
	x11-libs/libXext
	x11-libs/libXcomposite
	x11-libs/libXrender

	media-sound/pulseaudio

	config-tool? (
		=x11-libs/gtk+-3*
		dev-lang/lua:0
		dev-lua/luafilesystem
		dev-lua/lgi
	)

	obs? ( media-video/obs-studio )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	# Null lua_version to make it use slot 0 binaries
	meson_src_configure -Dlua_version= -Ddisable_config=$(usex config-tool false true) -Ddisable_obs=$(usex obs false true)
}
