#!/bin/bash

. scripts/common_variables

${QEMU_BIN} \
    ${MACH_ARGS} \
    -kernel ${SALUS_BINS}salus \
    -device guest-loader,kernel=${TELLUS_BINS}tellus_guestvm,addr=${KERNEL_ADDR} \
    ${EXTRA_QEMU_ARGS}
