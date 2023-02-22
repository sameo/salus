package(default_visibility = ["//visibility:public"])

load("@rules_rust//rust:defs.bzl", "rust_binary", "rust_clippy", "rustfmt_test")
load("//src:objcopy.bzl", "objcopy_elf_to_bin")

config_setting(
    name = "debug_mode",
    values = {
        "compilation_mode": "dbg",
    },
)

config_setting(
    name = "optimized_mode",
    values = {
        "compilation_mode": "opt",
    },
)

config_setting(
    name = "fastbuild",
    values = {
        "compilation_mode": "fastbuild",
    },
)

objcopy_elf_to_bin(
    name = "umode_to_object",
    src = "//u-mode:umode",
    out = "umode.o",
)

rust_binary(
    name = "salus",
    srcs = glob(["*.rs"]),
    crate_features = ["bazel"],
    data = glob(["*.S"]) + ["//src:umode_to_object"],
    linker_script = select({
        "optimized_mode": "salus-opt.lds",
        "debug_mode": "salus-dbg.lds",
        "fastbuild": "salus-fastbuild.lds",
    }),
    rustc_flags = [
        "-Ctarget-feature=+v",
        "--codegen=link-arg=-nostartfiles",
    ],
    deps = [
        "//attestation",
        "//data-model",
        "//device-tree",
        "//drivers",
        "//hyp-alloc",
        "//page-tracking",
        "//rice",
        "//riscv-elf",
        "//riscv-page-tables",
        "//riscv-pages",
        "//riscv-regs",
        "//s-mode-utils",
        "//sbi-rs",
        "//u-mode-api",
        "@salus-default//:spin",
        "@salus-index//:arrayvec",
        "@rice-index//:const-oid",
        "@rice-index//:der",
        "@rice-index//:digest",
        "@rice-index//:ed25519-dalek",
        "@rice-index//:generic-array",
        "@rice-index//:hkdf",
        "@salus-index//:memoffset",
        "@rice-index//:sha2",
        "@salus-index//:static_assertions",
    ],
)

rust_clippy(
    name = "clippy",
    deps = ["salus"],
)

rustfmt_test(
    name = "rustfmt",
    targets = ["salus"],
)
