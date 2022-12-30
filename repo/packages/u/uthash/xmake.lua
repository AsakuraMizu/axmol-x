package("uthash")

    set_homepage("https://github.com/troydhanson/uthash")
    set_description("A multi-platform support c++11 library with focus on asio (asynchronous socket I/O) for any client applications.")
    
    set_urls("https://github.com/troydhanson/uthash.git")
    add_versions("v2.3.0", "e493aa90a2833b4655927598f169c31cfcdf7861")

    on_install(function (package)
        os.cp("src", path.join(package:installdir("include"), "uthash"))
    end)
