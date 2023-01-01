package("uthash")

    set_kind("library", {headeronly=true})
    set_homepage("https://github.com/troydhanson/uthash")
    set_description("A multi-platform support c++11 library with focus on asio (asynchronous socket I/O) for any client applications.")
    
    set_urls("https://github.com/troydhanson/uthash.git")
    add_versions("v2.3.0", "e493aa90a2833b4655927598f169c31cfcdf7861")

    on_install(function (package)
        io.writefile("xmake.lua", [[
            add_rules("mode.debug", "mode.release")
            target("uthash")
                set_kind("headeronly")
                add_headerfiles("src/*.h")
        ]])
        import("package.tools.xmake").install(package)
    end)
