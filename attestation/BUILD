package(default_visibility = ["//visibility:public"])

load("@rules_rust//rust:defs.bzl", "rust_clippy", "rust_library", "rustfmt_test")

rust_library(
    name = "attestation",
    srcs = glob(["src/**/*.rs"]),
    deps = [
        "//rice",
        "//sbi-rs",
        "@salus-index//:arrayvec",
        "@salus-index//:const-oid",
        "@salus-index//:der",
        "@salus-index//:digest",
        "@salus-index//:ed25519",
        "@salus-index//:ed25519-dalek",
        "@salus-index//:flagset",
        "@salus-index//:generic-array",
        "@salus-index//:hex",
        "@salus-index//:hkdf",
        "@salus-index//:hmac",
        "@salus-index//:spki",
        "@salus-index//:typenum",
        "@salus-rwlock//:spin",
    ],
)

rust_clippy(
    name = "clippy",
    deps = ["attestation"],
)

rustfmt_test(
    name = "rustfmt",
    targets = ["attestation"],
)
