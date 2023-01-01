package("mio-ax")
    set_base("mio")
    add_patches("2021.9.21", path.join(os.scriptdir(), "windows.patch"), "68006b30090c859113b9cf2dfc4918fc4f21246095283012544fc9c15249bf50")

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
