package("glad")

    set_homepage("https://github.com/Dav1dde/glad")

    on_install(function (package)
        os.cp(path.join(os.scriptdir(), "glad", "*"), package:cachedir())
        import("package.tools.xmake").install(package)
    end)
