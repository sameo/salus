#!/bin/bash

. scripts/common_variables

${QEMU_BIN} \
    ${MACH_ARGS} \
    -kernel ${SALUS_BINS}salus \
    -device guest-loader,kernel=${LINUX_BIN},addr=${KERNEL_ADDR} \
    -append "${BOOTARGS} root=/dev/nvme0n1" \
    -drive file="${BUILDROOT_IMAGE},format=raw,id=hd" \
    ${NVME_DEVICE_ARGS} \
    ${IOMMU_ARGS} \
    ${NETWORK_ARGS} \
    ${EXTRA_QEMU_ARGS}
