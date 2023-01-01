package("ntcvt")

    set_homepage("https://github.com/simdsoft/ntcvt ")
    set_description(" The windows nt encoding converter helpers")
    set_license("Apache-2.0")

    set_urls("https://github.com/simdsoft/ntcvt/archive/refs/tags/v$(version).tar.gz")
    add_versions("0.0.1", "fb71851fe7cf96a618652705ab3d0ba1891827c0d04045ef283f2de5c6ebe960")

    on_install(function (package)
        os.cp("ntcvt.hpp", package:installdir("include"))
    end)
