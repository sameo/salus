package(default_visibility = ["//visibility:public"])

load("@rules_rust//rust:defs.bzl", "rust_binary", "rust_clippy", "rust_library", "rustfmt_test")
load("//test-workloads:objdump.bzl", "objdump_to_bin")

objdump_to_bin(
    name = "tellus_raw",
    src = ":tellus",
)

objdump_to_bin(
    name = "guestvm_raw",
    src = ":guestvm",
)

sh_binary(
    name = "create_guest_image",
    srcs = ["create_guest_image.sh"],
)

genrule(
    name = "tellus_guestvm_rule",
    srcs = [
        ":tellus_raw",
        ":guestvm_raw",
    ],
    outs = ["tellus_guestvm"],
    cmd = "$(location :create_guest_image) $(SRCS) $@",
    tools = [":create_guest_image"],
)

rust_binary(
    name = "tellus",
    srcs = [
        "src/bin/tellus.rs",
        "src/consts.rs",
    ],
    crate_root = "src/bin/tellus.rs",
    data = glob([
        "src/**/*.S",
    ]),
    linker_script = "qemu.lds",
    proc_macro_deps = ["@salus-index//:hex-literal"],
    rustc_flags = [
        "-Ctarget-feature=+v",
        "--codegen=link-arg=-nostartfiles",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//attestation",
        "//device-tree",
        "//rice",
        "//riscv-regs",
        "//s-mode-utils",
        "//sbi-rs",
        "//test-workloads",
        "@salus-default//:spin",
        "@salus-index//:arrayvec",
        "@salus-index//:der",
    ],
)

rust_binary(
    name = "guestvm",
    srcs = [
        "src/bin/guestvm.rs",
        "src/consts.rs",
    ],
    crate_root = "src/bin/guestvm.rs",
    data = glob([
        "src/**/*.S",
        "src/**/*.der",
    ]),
    linker_script = "guest.lds",
    proc_macro_deps = ["@salus-index//:hex-literal"],
    rustc_flags = [
        "-Ctarget-feature=+v",
        "--codegen=link-arg=-nostartfiles",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//attestation",
        "//device-tree",
        "//rice",
        "//riscv-regs",
        "//s-mode-utils",
        "//sbi-rs",
        "//test-workloads",
        "@salus-index//:arrayvec",
        "@salus-index//:der",
    ],
)

rust_library(
    name = "test-workloads",
    srcs = glob(["src/*.rs"]),
    data = glob([
        "src/**/*.S",
        "src/**/*.der",
    ]),
    proc_macro_deps = ["@salus-index//:hex-literal"],
    deps = [
        "//attestation",
        "//device-tree",
        "//rice",
        "//riscv-regs",
        "//s-mode-utils",
        "//sbi-rs",
        "@salus-index//:arrayvec",
        "@salus-index//:der",
    ],
)

rust_clippy(
    name = "clippy",
    deps = [
        "guestvm",
        "tellus",
        "test-workloads",
    ],
)

rustfmt_test(
    name = "rustfmt",
    targets = [
        "test-workloads",
        "tellus",
        "guestvm",
    ],
)
