# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson multilib-minimal

DESCRIPTION="Vulkan/OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more"
HOMEPAGE="https://github.com/flightlessmango/MangoHud"
SRC_URI="https://github.com/flightlessmango/MangoHud/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+system-vulkan nvml xnvctrl X wayland dbus dlsym"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-util/meson
	dev-python/mako
	dev-util/glslang:=[${MULTILIB_USEDEP}]
	media-libs/libglvnd:=[${MULTILIB_USEDEP}]
	dev-util/vulkan-headers
	media-libs/vulkan-loader:=[${MULTILIB_USEDEP}]
"

multilib_src_configure() {
	local emesonargs=(
		$(meson_feature system-vulkan use_system_vulkan)
		$(meson_feature nvml with_nvml)
		$(meson_feature xnvctrl with_xnvctrl)
		$(meson_feature X with_x11)
		$(meson_feature wayland with_wayland)
		$(meson_feature dbus with_dbus)
		$(meson_feature dlsym with_dlsym)
	)
	meson_src_configure -Dappend_libdir_mangohud=false
}
