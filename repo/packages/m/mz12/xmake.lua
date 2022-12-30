package("mz12")

    set_homepage("https://github.com/simdsoft/mz12")
    add_urls("https://github.com/simdsoft/mz12.git")

    add_deps("zlib")
    on_install(function (package)
        os.cp(path.join(os.scriptdir(), "port", "xmake.lua"), "xmake.lua")
        import("package.tools.xmake").install(package)
    end)
