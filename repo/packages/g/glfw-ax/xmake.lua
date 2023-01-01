package("glfw-ax")

    set_homepage("https://www.glfw.org/")
    set_description("GLFW is an Open Source, multi-platform library for OpenGL, OpenGL ES and Vulkan application development.")
    set_license("zlib")

    add_urls("https://github.com/glfw/glfw.git")
    add_versions("3.4.0", "57cbded0760a50b9039ee0cb3f3c14f60145567c")
    add_patches("3.4.0", path.join(os.scriptdir(), "patches", "ext.patch"), "344f50c90b635848c7c2b56f9fda5c18287be109d1f181d7d1f7678beec3a37c")

    add_configs("glfw_include", {description = "Choose submodules enabled in glfw", default = "none", type = "string", values = {"none", "vulkan", "glu", "glext", "es2", "es3"}})

    if is_plat("linux") then
        add_extsources("apt::libglfw3-dev", "pacman::glfw-x11")
    end

    add_deps("cmake")
    add_deps("opengl", {optional = true})
    if is_plat("macosx") then
        add_frameworks("Cocoa", "IOKit")
    elseif is_plat("windows") then
        add_syslinks("user32", "shell32", "gdi32")
    elseif is_plat("mingw") then
        add_syslinks("gdi32")
    elseif is_plat("linux") then
        -- TODO: add wayland support
        add_deps("libx11", "libxrandr", "libxrender", "libxinerama", "libxfixes", "libxcursor", "libxi", "libxext")
        add_syslinks("dl", "pthread")
        add_defines("_GLFW_X11")
    end

    on_load(function (package)
        package:add("defines", "GLFW_INCLUDE_" .. package:config("glfw_include"):upper())
    end)

    on_install("macosx", "windows", "linux", "mingw", function (package)
        local configs = {"-DGLFW_BUILD_DOCS=OFF", "-DGLFW_BUILD_TESTS=OFF", "-DGLFW_BUILD_EXAMPLES=OFF"}
        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:debug() and "Debug" or "Release"))
        table.insert(configs, "-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF"))
        if package:is_plat("windows") then
            table.insert(configs, "-DUSE_MSVC_RUNTIME_LIBRARY_DLL=" .. (package:config("vs_runtime"):startswith("MT") and "OFF" or "ON"))
        end
        if package:is_plat("linux") then
            import("package.tools.cmake").install(package, configs, {packagedeps = {"libxrender", "libxfixes", "libxext", "libx11"}})
        else
            import("package.tools.cmake").install(package, configs)
        end
    end)

    on_test(function (package)
        assert(package:check_csnippets({test = [[
            void test() {
                glfwInit();
                glfwTerminate();
            }
        ]]}, {configs = {languages = "c11"}, includes = "GLFW/glfw3.h"}))
    end)
