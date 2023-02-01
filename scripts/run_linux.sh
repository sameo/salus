#!/bin/bash

. scripts/common_variables

${QEMU_BIN} \
    ${MACH_ARGS} \
    -kernel ${SALUS_BINS}salus \
    -device guest-loader,kernel=${LINUX_BIN},addr=${KERNEL_ADDR} \
    -append "${BOOTARGS}" \
    ${EXTRA_QEMU_ARGS}
