package(default_visibility = ["//visibility:public"])

load("@rules_rust//rust:defs.bzl", "rust_clippy", "rust_library", "rustfmt_test")

rust_library(
    name = "attestation",
    srcs = glob(["src/**/*.rs"]),
    deps = [
        "//rice",
        "//sbi-rs",
        "@salus-index//:arrayvec",
        "@rice-index//:const-oid",
        "@rice-index//:der",
        "@rice-index//:digest",
        "@rice-index//:ed25519",
        "@rice-index//:ed25519-dalek",
        "@salus-index//:flagset",
        "@rice-index//:generic-array",
        "@salus-index//:hex",
        "@rice-index//:hkdf",
        "@rice-index//:hmac",
        "@rice-index//:spki",
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
