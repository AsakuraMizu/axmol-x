package("robin-map")

    set_kind("library", {headeronly = true})
    set_homepage("https://github.com/Tessil/robin-map")
    set_description("A C++ implementation of a fast hash map and hash set using robin hood hashing")
    set_license("MIT")

    add_urls("https://github.com/Tessil/robin-map/archive/refs/tags/$(version).tar.gz")
    add_versions("v1.0.1", "b2ffdb623727cea852a66bddcb7fa6d938538a82b40e48294bb581fe086ef005")
    add_patches("v1.0.1", path.join(os.scriptdir(), "v1.0.1.patch"), "dc6b75b000588247bdc1dccc1c8019fa230be47f12f4aadf79483bcadf069152")

    add_deps("cmake")
    on_install(function (package)
        import("package.tools.cmake").install(package)
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
            void test() {
                tsl::robin_map<int, int> map = {{1, 1}, {2, 1}, {3, 1}};
                for (auto it = map.begin(); it != map.end(); ++it) {
                    it.value() = 2;
                }
            }
        ]]}, {configs = {languages = "c++11"}, includes = "tsl/robin_map.h"}))
    end)
