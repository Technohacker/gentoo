# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="OpenGL audio spectrum visualizer"
HOMEPAGE="https://github.com/jarcode-foss/glava"
SRC_URI="https://github.com/jarcode-foss/glava/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	x11-base/xorg-server
	x11-libs/libXext
	x11-libs/libXcomposite
	x11-libs/libXrender
	media-sound/pulseaudio
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
}
