package("poly2tri")

    set_homepage("https://github.com/greenm01/poly2tri")

    set_urls("https://github.com/greenm01/poly2tri.git")

    on_install(function (package)
        io.writefile("xmake.lua", [[
            add_rules("mode.debug", "mode.release")
            target("poly2tri")
                set_kind("$(kind)")
                add_files("poly2tri/common/*.cc", "poly2tri/sweep/*.cc")
                add_headerfiles("(poly2tri/**/*.h)", "(poly2tri/poly2tri.h)")
        ]])
        import("package.tools.xmake").install(package)
    end)
