def ray_register_toolchains():
    native.register_toolchains(
        "//thirdparty/toolchains/embedded/arm-linux/aarch64:aarch64-linux-crosstool",
        "//thirdparty/toolchains/embedded/arm-linux/armhf:armhf-linux-crosstool",
    )
