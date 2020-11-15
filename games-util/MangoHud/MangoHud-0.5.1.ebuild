# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Vulkan/OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more"
HOMEPAGE="https://github.com/flightlessmango/MangoHud"
SRC_URI="https://github.com/flightlessmango/MangoHud/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-util/meson
	dev-python/mako
	dev-util/glslang
	media-libs/libglvnd
	dev-util/vulkan-headers
	media-libs/vulkan-loader
"

src_configure() {
	meson_src_configure -Dappend_libdir_mangohud=false -Duse_system_vulkan=enabled -Dwith_xnvctrl=disabled
}
