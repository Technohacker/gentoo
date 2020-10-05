# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="SteamOS Compositor Plus"
HOMEPAGE="https://github.com/gamer-os/steamos-compositor-plus"
SRC_URI="https://github.com/gamer-os/${PN}/archive/${PV}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	eapply_user
	eautoreconf
}

src_install() {
	default

	install -m 755 "usr/bin/steamos-session" "${D}/usr/bin"
	sed -i "s|x86_64-linux-gnu/||g" "${D}/usr/bin/steamos-session"
	sed -i "s|lib/i386-linux-gnu/|lib32/|g" "${D}/usr/bin/steamos-session"
	mkdir -p "${D}/usr/share/steamos-compositor-plus/bin" "${D}/usr/share/xsessions" "${D}/usr/share/icons/steam" "${D}/usr/share/pixmaps"
	install -m 755 "usr/share/steamos-compositor-plus/bin/set_hd_mode.sh" "${D}/usr/share/steamos-compositor-plus/bin/set_hd_mode.sh"
	install -m 755 "usr/share/steamos-compositor-plus/bin/dpkg-query" "${D}/usr/share/steamos-compositor-plus/bin/dpkg-query"
	install -m 644 "usr/share/xsessions/steamos.desktop" "${D}/usr/share/xsessions"
	install -m 644 "usr/share/icons/steam/arrow.png" "${D}/usr/share/icons/steam"
	install -m 644 "usr/share/pixmaps/steam-bootstrapper.jpg" "${D}/usr/share/pixmaps"

	# font workaround for initial big picture mode startup
	mkdir -p "${D}/usr/share/fonts/truetype/ttf-dejavu"
	ln -s /usr/share/fonts/TTF/DejaVuSans.ttf "${D}/usr/share/fonts/truetype/ttf-dejavu/DejaVuSans.ttf"
}
