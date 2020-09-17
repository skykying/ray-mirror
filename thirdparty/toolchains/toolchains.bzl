load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")

# Sanitize a dependency so that it works correctly from code that includes
# TensorFlow as a submodule.
def clean_dep(dep):
    return str(Label(dep))

def ray_setup_toolchains():
    http_archive(
        name = "arm_compiler",
        build_file = clean_dep("//thirdparty/toolchains/cpus/arm:arm_compiler.BUILD"),
        sha256 = "b9e7d50ffd9996ed18900d041d362c99473b382c0ae049b2fce3290632d2656f",
        strip_prefix = "rpi-newer-crosstools-eb68350c5c8ec1663b7fe52c742ac4271e3217c5/x64-gcc-6.5.0/arm-rpi-linux-gnueabihf/",
        urls = [
            "https://storage.googleapis.com/mirror.tensorflow.org/github.com/rvagg/rpi-newer-crosstools/archive/eb68350c5c8ec1663b7fe52c742ac4271e3217c5.tar.gz",
            "https://github.com/rvagg/rpi-newer-crosstools/archive/eb68350c5c8ec1663b7fe52c742ac4271e3217c5.tar.gz",
        ],
    )

    http_archive(
        # This is the latest `aarch64-none-linux-gnu` compiler provided by ARM
        # See https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads
        # The archive contains GCC version 9.2.1
        name = "aarch64_compiler",
        build_file = clean_dep("//thirdparty/toolchains/cpus/arm:arm_compiler.BUILD"),
        sha256 = "8dfe681531f0bd04fb9c53cf3c0a3368c616aa85d48938eebe2b516376e06a66",
        strip_prefix = "gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu",
        urls = [
            "https://storage.googleapis.com/mirror.tensorflow.org/developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz",
            "https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz",
        ],
    )

    http_archive(
        name = "aarch64_linux_toolchain",
        build_file = clean_dep("//thirdparty/toolchains/embedded/arm-linux/aarch64:aarch64-linux-toolchain.BUILD"),
        sha256 = "8ce3e7688a47d8cd2d8e8323f147104ae1c8139520eca50ccf8a7fa933002731",
        strip_prefix = "gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu",
        urls = [
            "https://storage.googleapis.com/mirror.tensorflow.org/developer.arm.com/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz",
            "https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz",
        ],
    )

    http_archive(
        name = "armhf_linux_toolchain",
        build_file = clean_dep("//thirdparty/toolchains/embedded/arm-linux/armhf:armhf-linux-toolchain.BUILD"),
        sha256 = "d4f6480ecaa99e977e3833cc8a8e1263f9eecd1ce2d022bb548a24c4f32670f5",
        strip_prefix = "gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf",
        urls = [
            "https://storage.googleapis.com/mirror.tensorflow.org/developer.arm.com/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz",
            "https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz",
        ],
    )

def ray_register_toolchains():
    native.register_toolchains(
        "//thirdparty/toolchains/embedded/arm-linux/aarch64:aarch64-linux-crosstool",
        "//thirdparty/toolchains/embedded/arm-linux/armhf:armhf-linux-crosstool",
    )
