package("clipper2")

    set_homepage("https://github.com/AngusJohnson/Clipper2")
    set_description(" Polygon Clipping and Offsetting - C++, C# and Delphi")
    set_license("BSL-1.0 license")

    set_urls("https://github.com/AngusJohnson/Clipper2/releases/download/Clipper2_$(version)/Clipper2_$(version).zip")
    add_versions("1.0.6", "4501af5ed4c883900bdb83ccd439d5844bbe7df850d1ab53814b5daedce07fc9")

    on_install(function (package)
        io.writefile("xmake.lua", [[
            add_rules("mode.debug", "mode.release")
            target("clipper2")
                set_kind("$(kind)")
                add_includedirs("CPP/Clipper2Lib/include")
                add_files("CPP/Clipper2Lib/src/*.cpp")
                add_headerfiles("CPP/Clipper2Lib/include/(clipper2/*.h)")
        ]])
        import("package.tools.xmake").install(package)
    end)
