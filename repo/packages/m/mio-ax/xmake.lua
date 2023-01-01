package("mio-ax")
    set_base("mio")
    add_patches("2021.9.21", path.join(os.scriptdir(), "windows.patch"), "3f00675ab8051db813e6dcc6e49e28949deca0d78f503740a7f6813a1aa37b15")

    on_install(function (package)
        os.cp("single_include/mio", package:installdir("include"))
    end)

    on_test(function(package)
        assert(package:check_cxxsnippets({
            test = [[
              #include <string>
              #include <vector>
              #include <algorithm>
              #include <mio/mio.hpp>
              static void test() {
                mio::mmap_source mmap();
              }
            ]]
        }, {configs = {languages = "c++11"}}))
    end)
