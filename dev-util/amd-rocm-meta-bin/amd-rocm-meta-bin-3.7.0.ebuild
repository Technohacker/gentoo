# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm

DESCRIPTION="AMD ROCm"
HOMEPAGE="https://github.com/RadeonOpenCompute/"
SRC_URI="
https://repo.radeon.com/rocm/yum/3.7/atmi-0.7.11-Linux.rpm -> ${PN}-${PV}-1.rpm
https://repo.radeon.com/rocm/yum/3.7/comgr-1.6.0.149-rocm-rel-3.7-20-6670e0d-Linux.rpm -> ${PN}-${PV}-2.rpm
https://repo.radeon.com/rocm/yum/3.7/half-1.12.0-el7.x86_64.rpm -> ${PN}-${PV}-3.rpm
https://repo.radeon.com/rocm/yum/3.7/hip-base-3.7.20315-077bcfa0.x86_64.rpm -> ${PN}-${PV}-4.rpm
https://repo.radeon.com/rocm/yum/3.7/hip-doc-3.7.20315-077bcfa0.x86_64.rpm -> ${PN}-${PV}-5.rpm
https://repo.radeon.com/rocm/yum/3.7/hip-nvcc-3.7.20315-077bcfa0.x86_64.rpm -> ${PN}-${PV}-6.rpm
https://repo.radeon.com/rocm/yum/3.7/hip-rocclr-3.7.20315-077bcfa0.x86_64.rpm -> ${PN}-${PV}-7.rpm
https://repo.radeon.com/rocm/yum/3.7/hip-samples-3.7.20315-077bcfa0.x86_64.rpm -> ${PN}-${PV}-8.rpm
https://repo.radeon.com/rocm/yum/3.7/hipblas-0.32.0.414-20-abd7261-el7.x86_64.rpm -> ${PN}-${PV}-9.rpm
https://repo.radeon.com/rocm/yum/3.7/hipcub-2.10.3.195-20-8503466-el7.x86_64.rpm -> ${PN}-${PV}-10.rpm
https://repo.radeon.com/rocm/yum/3.7/hipify-clang-11.0.0.x86_64.rpm -> ${PN}-${PV}-11.rpm
https://repo.radeon.com/rocm/yum/3.7/hipsparse-1.8.1.295-20-f7e601a-el7.x86_64.rpm -> ${PN}-${PV}-12.rpm
https://repo.radeon.com/rocm/yum/3.7/hsa-amd-aqlprofile-1.0.0-Linux.rpm -> ${PN}-${PV}-13.rpm
https://repo.radeon.com/rocm/yum/3.7/hsa-rocr-dev-1.2.30700.0-rocm-rel-3.7-20-99e66a7a-Linux.rpm -> ${PN}-${PV}-14.rpm
https://repo.radeon.com/rocm/yum/3.7/hsakmt-roct-1.0.9-363-gd9efc3d.x86_64.rpm -> ${PN}-${PV}-15.rpm
https://repo.radeon.com/rocm/yum/3.7/hsakmt-roct-devel-1.0.9-363-gd9efc3d.x86_64.rpm -> ${PN}-${PV}-16.rpm
https://repo.radeon.com/rocm/yum/3.7/llvm-amdgpu-11.0.dev-1.x86_64.rpm -> ${PN}-${PV}-17.rpm
https://repo.radeon.com/rocm/yum/3.7/migraphx-0.7.0.3869-20-e66968a2-el7.x86_64.rpm -> ${PN}-${PV}-18.rpm
https://repo.radeon.com/rocm/yum/3.7/miopen-hip-2.6.0.8145-20-c16087a4-el7.x86_64.rpm -> ${PN}-${PV}-19.rpm
https://repo.radeon.com/rocm/yum/3.7/miopen-opencl-2.6.0.8145-20-c16087a4-el7.x86_64.rpm -> ${PN}-${PV}-20.rpm
https://repo.radeon.com/rocm/yum/3.7/miopengemm-1.1.6.647-20-b51a125-el7.x86_64.rpm -> ${PN}-${PV}-21.rpm
https://repo.radeon.com/rocm/yum/3.7/miopenkernels-gfx900-56-1.0.0-el7.x86_64.rpm -> ${PN}-${PV}-22.rpm
https://repo.radeon.com/rocm/yum/3.7/miopenkernels-gfx900-64-1.0.0-el7.x86_64.rpm -> ${PN}-${PV}-23.rpm
https://repo.radeon.com/rocm/yum/3.7/miopenkernels-gfx906-60-1.0.0-el7.x86_64.rpm -> ${PN}-${PV}-24.rpm
https://repo.radeon.com/rocm/yum/3.7/miopenkernels-gfx906-64-1.0.0-el7.x86_64.rpm -> ${PN}-${PV}-25.rpm
https://repo.radeon.com/rocm/yum/3.7/mivisionx-1.9.0-1.x86_64.rpm -> ${PN}-${PV}-26.rpm
https://repo.radeon.com/rocm/yum/3.7/rccl-2.7.6.447-20-d1e20b4-el7.x86_64.rpm -> ${PN}-${PV}-27.rpm
https://repo.radeon.com/rocm/yum/3.7/rdc-1.0.0.0.rocm-rel-3.7-20-a86ad63.x86_64.rpm -> ${PN}-${PV}-28.rpm
https://repo.radeon.com/rocm/yum/3.7/rocalution-1.9.2.495-20-d3cdc72-el7.x86_64.rpm -> ${PN}-${PV}-29.rpm
https://repo.radeon.com/rocm/yum/3.7/rocblas-2.26.0.2565-9d981389-el7.x86_64.rpm -> ${PN}-${PV}-30.rpm
https://repo.radeon.com/rocm/yum/3.7/rocfft-1.0.5.871-20-35f7181-el7.x86_64.rpm -> ${PN}-${PV}-31.rpm
https://repo.radeon.com/rocm/yum/3.7/rock-dkms-3.7-20.el7.noarch.rpm -> ${PN}-${PV}-32.rpm
https://repo.radeon.com/rocm/yum/3.7/rock-dkms-firmware-3.7-20.el7.noarch.rpm -> ${PN}-${PV}-33.rpm
https://repo.radeon.com/rocm/yum/3.7/rocm-bandwidth-test-1.4.0.13-rocm-rel-3.7-20-gf671f73-Linux.rpm -> ${PN}-${PV}-34.rpm
https://repo.radeon.com/rocm/yum/3.7/rocm-clang-ocl-0.5.0.49-rocm-rel-3.7-20-7b47f7d-el7.x86_64.rpm -> ${PN}-${PV}-35.rpm
https://repo.radeon.com/rocm/yum/3.7/rocm-cmake-0.3.0.153-rocm-rel-3.7-20-1d1caa5-el7.x86_64.rpm -> ${PN}-${PV}-36.rpm
https://repo.radeon.com/rocm/yum/3.7/rocm-dbgapi-0.30.0_rocm_rel_3.7_20-1.x86_64.rpm -> ${PN}-${PV}-37.rpm
https://repo.radeon.com/rocm/yum/3.7/rocm-debug-agent-2.0.1_rocm_rel_3.7_20-1.x86_64.rpm -> ${PN}-${PV}-38.rpm
https://repo.radeon.com/rocm/yum/3.7/rocm-debug-agent-tests-2.0.1_rocm_rel_3.7_20-1.x86_64.rpm -> ${PN}-${PV}-39.rpm
https://repo.radeon.com/rocm/yum/3.7/rocm-dev-3.7.0-20-Linux.rpm -> ${PN}-${PV}-40.rpm
https://repo.radeon.com/rocm/yum/3.7/rocm-device-libs-1.0.0.588-rocm-rel-3.7-20-5ff5319-Linux.rpm -> ${PN}-${PV}-41.rpm
https://repo.radeon.com/rocm/yum/3.7/rocm-dkms-3.7.0-20-Linux.rpm -> ${PN}-${PV}-42.rpm
https://repo.radeon.com/rocm/yum/3.7/rocm-gdb-9.2-rocm-rel-3.7-20.x86_64.rpm -> ${PN}-${PV}-43.rpm
https://repo.radeon.com/rocm/yum/3.7/rocm-libs-3.7.0-20-Linux.rpm -> ${PN}-${PV}-44.rpm
https://repo.radeon.com/rocm/yum/3.7/rocm-opencl-2.0.0.293-rocm-rel-3.7-20-3f18143.x86_64.rpm -> ${PN}-${PV}-45.rpm
https://repo.radeon.com/rocm/yum/3.7/rocm-opencl-devel-2.0.0.293-rocm-rel-3.7-20-3f18143.x86_64.rpm -> ${PN}-${PV}-46.rpm
https://repo.radeon.com/rocm/yum/3.7/rocm-smi-1.0.0_204_rocm_rel_3.7_20_g08ebddd-1.x86_64.rpm -> ${PN}-${PV}-47.rpm
https://repo.radeon.com/rocm/yum/3.7/rocm-smi-lib64-2.4.0.15.rocm-rel-3.7-20-d325613.x86_64.rpm -> ${PN}-${PV}-48.rpm
https://repo.radeon.com/rocm/yum/3.7/rocm-utils-3.7.0-20-Linux.rpm -> ${PN}-${PV}-49.rpm
https://repo.radeon.com/rocm/yum/3.7/rocm-validation-suite-3.7.30700.rpm -> ${PN}-${PV}-50.rpm
https://repo.radeon.com/rocm/yum/3.7/rocminfo-1.3.0.5.rocm-rel-3.7-20-605b3a5.rpm -> ${PN}-${PV}-51.rpm
https://repo.radeon.com/rocm/yum/3.7/rocprim-2.10.3.1079-20-5e3f41e-el7.x86_64.rpm -> ${PN}-${PV}-52.rpm
https://repo.radeon.com/rocm/yum/3.7/rocprofiler-dev-1.0.0-Linux.rpm -> ${PN}-${PV}-53.rpm
https://repo.radeon.com/rocm/yum/3.7/rocrand-2.10.3.709-20-450fece-Linux.rpm -> ${PN}-${PV}-54.rpm
https://repo.radeon.com/rocm/yum/3.7/rocsolver-3.7.0.129-20-de0a6c0-el7.x86_64.rpm -> ${PN}-${PV}-55.rpm
https://repo.radeon.com/rocm/yum/3.7/rocsparse-1.15.5.825-20-467eb42-el7.x86_64.rpm -> ${PN}-${PV}-56.rpm
https://repo.radeon.com/rocm/yum/3.7/rocthrust-2.10.3.603-20-529bb95-el7.x86_64.rpm -> ${PN}-${PV}-57.rpm
https://repo.radeon.com/rocm/yum/3.7/roctracer-dev-1.0.0-Linux.rpm -> ${PN}-${PV}-58.rpm
"

LICENSE="MIT"
SLOT="0/$(ver_cut 1-2)"
KEYWORDS="~amd64"
S="${WORKDIR}"

RDEPEND="!dev-libs/rocr-runtime"

src_prepare() {
	default
}

src_install() {
	dodir /opt
	cp -ar opt/* "${D}"/opt/ || die

	echo "/opt/rocm-${PV}/opencl/lib/libamdocl64.so" > amdocl64.icd
	insinto /etc/OpenCL/vendors
	doins "amdocl64.icd"

	echo "HSA_PATH=/opt/rocm-${PV}" > 99rocm || die
	echo "ROCM_PATH=/opt/rocm-${PV}" >> 99rocm || die
	echo "ROCM_AGENT_ENUM=/opt/rocm-${PV}/bin/rocm_agent_enumerator" >> 99rocm || die
	echo "HCC_HOME=/opt/rocm-${PV}/hcc" >> 99rocm || die
	echo "HIP_PATH=/opt/rocm-${PV}/hip" >> 99rocm || die
	echo "HIP_PLATFORM=hcc" >> 99rocm || die
	echo "LDPATH=/opt/rocm-${PV}/lib:/opt/rocm-${PV}/lib64:/opt/rocm-${PV}/hcc/lib:/opt/rocm-${PV}/hip/lib:/opt/rocm-${PV}/hsa/lib:/opt/rocm-${PV}/opencl/lib/x86_64:/opt/rocm-${PV}/rocrand/lib" >> 99rocm || die
	echo "PATH=/opt/rocm-${PV}/bin:/opt/rocm-${PV}/hcc/bin:/opt/rocm-${PV}/hip/bin" >> 99rocm || die
	echo "ROOTPATH=/opt/rocm-${PV}/bin:/opt/rocm-${PV}/hcc/bin:/opt/rocm-${PV}/hip/bin" >> 99rocm || die
	doenvd 99rocm
}
