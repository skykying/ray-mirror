package(default_visibility = ["//visibility:public"])

load(":cc_config_aarch64.bzl", "cc_toolchain_aarch64_config")


licenses(["restricted"])  # GPLv3


cc_toolchain_suite(
    name = "toolchain",
    toolchains = {
        "k8": ":cc-compiler-aarch64",
    },
)

filegroup(
    name = "empty",
    srcs = [],
)

filegroup(
    name = "aarch64_toolchain_all_files",
    srcs = [
        "@aarch64_linux_toolchain//:compiler_pieces",
    ],
)


cc_toolchain_aarch64_config(
    name = "aarch64_toolchain_config",
)

cc_toolchain(
    name = "cc-compiler-aarch64",
    all_files = ":aarch64_toolchain_all_files",
    compiler_files = ":aarch64_toolchain_all_files",
    dwp_files = ":empty",
    linker_files = ":aarch64_toolchain_all_files",
    objcopy_files = "aarch64_toolchain_all_files",
    strip_files = "aarch64_toolchain_all_files",
    supports_param_files = 1,
    toolchain_config = ":aarch64_toolchain_config",
)

toolchain(
    name = "aarch64-linux-crosstool",
    exec_compatible_with = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
    target_compatible_with = [
        "@platforms//os:linux",
        "@platforms//cpu:aarch64",
    ],
    # No 64bit source is available, so we reuse the 32bit one.
    toolchain = ":cc-compiler-aarch64",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)

