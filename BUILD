# to build salus:
# bazel build //:salus-all

# before pull request
# bazel build //:clippy-all
# bazel test //:rustfmt-all
# bazel test //:test-all

filegroup(
    name = "salus-all",
    srcs = [
        "//src:salus",
        "//test-workloads:tellus_guestvm",
    ],
)

filegroup(
    name = "clippy-all",
    srcs = [
        "//attestation:clippy",
        "//data-model:clippy",
        "//device-tree:clippy",
        "//drivers:clippy",
        "//hyp-alloc:clippy",
        "//libuser:clippy",
        "//page-tracking:clippy",
        "//rice:clippy",
        "//riscv-elf:clippy",
        "//riscv-page-tables:clippy",
        "//riscv-pages:clippy",
        "//riscv-regs:clippy",
        "//s-mode-utils:clippy",
        "//sbi-rs:clippy",
        "//src:clippy",
        "//test-workloads:clippy",
        "//u-mode:clippy",
        "//u-mode-api:clippy",
    ],
)

test_suite(
    name = "rustfmt-all",
    tests = [
        "//attestation:rustfmt",
        "//data-model:rustfmt",
        "//device-tree:rustfmt",
        "//drivers:rustfmt",
        "//hyp-alloc:rustfmt",
        "//libuser:rustfmt",
        "//page-tracking:rustfmt",
        "//rice:rustfmt",
        "//riscv-elf:rustfmt",
        "//riscv-page-tables:rustfmt",
        "//riscv-pages:rustfmt",
        "//riscv-regs:rustfmt",
        "//s-mode-utils:rustfmt",
        "//sbi-rs:rustfmt",
        "//src:rustfmt",
        "//test-workloads:rustfmt",
        "//u-mode:rustfmt",
        "//u-mode-api:rustfmt",
    ],
)

test_suite(
    name = "test-all",
    tests = [
        "//data-model:data-model-test",
        "//device-tree:device-tree-test",
        "//drivers:drivers-test",
        "//hyp-alloc:hyp-alloc-test",
        "//page-tracking:page-tracking-test",
        "//rice:rice-test",
        "//riscv-elf:riscv-elf-test",
        "//riscv-page-tables:riscv-page-tables-test",
        "//riscv-pages:riscv-pages-test",
    ],
)
