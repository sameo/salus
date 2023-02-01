package(default_visibility = ["//visibility:public"])

load("@rules_rust//rust:defs.bzl", "rust_clippy", "rust_library", "rust_test", "rustfmt_test")

rust_library(
    name = "page-tracking",
    srcs = glob(["src/**/*.rs"]),
    deps = [
        "//riscv-pages",
        "@salus-default//:spin",
        "@salus-index//:arrayvec",
    ],
)

rust_clippy(
    name = "clippy",
    deps = ["page-tracking"],
)

rustfmt_test(
    name = "rustfmt",
    targets = ["page-tracking"],
)

rust_test(
    name = "page-tracking-test",
    crate = ":page-tracking",
)
