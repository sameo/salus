package(default_visibility = ["//visibility:public"])

load("@rules_rust//rust:defs.bzl", "rust_clippy", "rust_library", "rustfmt_test")

rust_library(
    name = "s-mode-utils",
    srcs = glob(["src/**/*.rs"]),
    # this uses once spin instead of nodefault
    deps = [
        "//sbi-rs",
        "@salus-once//:spin",
    ],
)

rust_clippy(
    name = "clippy",
    deps = ["s-mode-utils"],
)

rustfmt_test(
    name = "rustfmt",
    targets = ["s-mode-utils"],
)
