package("xsbase")

    set_kind("library", {headeronly = true})
    set_homepage("https://github.com/simdsoft/xsbase")
    set_description("The x-studio base library")
    set_license("MIT")

    add_urls("https://github.com/simdsoft/xsbase.git")
    add_versions("v1.0", "e14cd0801759e42cc3837395476b4e89c51f716f")

    on_install(function (package)
        os.mkdir(path.join(package:installdir("include"), "xsbase"))
        os.cp("*.hpp", path.join(package:installdir("include"), "xsbase"))
        os.cp("xsxml", path.join(package:installdir("include"), "xsbase"))
    end)
