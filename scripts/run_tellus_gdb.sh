#!/bin/bash

. scripts/common_variables

${QEMU_BIN} \
    -s -S ${MACH_ARGS} \
    -kernel ${SALUS_BINS}salus \
    -device guest-loader,kernel=tellus_guestvm,addr=${KERNEL_ADDR} \
    ${EXTRA_QEMU_ARGS}
