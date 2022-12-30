package("yasio")

    set_homepage("https://github.com/yasio/yasio")
    set_description("A multi-platform support c++11 library with focus on asio (asynchronous socket I/O) for any client applications.")
    set_license("MIT")

    set_urls("https://github.com/yasio/yasio/archive/refs/tags/v$(version).tar.gz")
    add_versions("3.39.5", "c850769ec2bf69b6fff9ce67a111ffe0ad28998e819ed543d7f3f54c47d542c9")

    on_install(function (package)
        os.cp("yasio", package:installdir("include"))
    end)
