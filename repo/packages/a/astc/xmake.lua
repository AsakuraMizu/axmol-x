package("astc")

    set_homepage("https://github.com/ARM-software/astc-encoder")
    set_description("The Arm ASTC Encoder, a compressor for the Adaptive Scalable Texture Compression data format.")

    set_urls("https://github.com/ARM-software/astc-encoder.git")
    add_versions("4.2.0", "3103c70ccf6194e3796467c466f5adb047deac7f")

    on_install(function (package)
        io.writefile("xmake.lua", [[
            add_rules("mode.debug", "mode.release")
            target("astc")
                set_kind("$(kind)")
                add_includedirs("Source")
                add_files("Source/astcenc_*.cpp")
                add_headerfiles("Source/astcenc_*.h", "Source/astcenc.h")
        ]])
        import("package.tools.xmake").install(package)
    end)
