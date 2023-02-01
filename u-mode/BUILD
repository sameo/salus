package(default_visibility = ["//visibility:public"])

load("@rules_rust//rust:defs.bzl", "rust_binary", "rust_clippy", "rustfmt_test")
load("@rules_rust//crate_universe:defs.bzl", "crate", "crates_repository")

rust_binary(
    name = "umode",
    srcs = glob(["src/*.rs"]),
    linker_script = "umode.lds",
    rustc_flags = ["--codegen=link-arg=-nostartfiles"],
    deps = [
        "//data-model",
        "//libuser",
        "//rice",
        "//u-mode-api",
        "@salus-index//:const-oid",
        "@salus-index//:der",
        "@salus-index//:ed25519",
        "@salus-index//:ed25519-dalek",
        "@salus-index//:generic-array",
        "@salus-index//:sha2",
    ],
)

rust_clippy(
    name = "clippy",
    deps = ["umode"],
)

rustfmt_test(
    name = "rustfmt",
    targets = ["umode"],
)
