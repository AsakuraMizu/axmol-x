add_requires(
    "astc",
    "bullet3",
    "chipmunk2d",
    "clipper2",
    "freetype",
    "glad",
    "libjpeg",
    "libogg",
    "libpng",
    "libvorbis",
    "libwebp",
    "llhttp",
    "lz4",
    "minimp3",
    "mio",
    "mz12",
    "openal-soft",
    "poly2tri",
    "pugixml v1.12.1",
    "rapidjson v1.1.0",
    "recastnavigation main",
    "robin-map",
    "stb",
    "uthash",
    "xsbase",
    "xxhash",
    "yasio"
    )

if is_os("linux") then
    add_requires("fontconfig", "glfw")
end

target("axmol")
    set_kind("static")
    add_includedirs(".", "platform", {public=true})

    add_files("2d/*.cpp", "3d/*.cpp", "audio/*.cpp", "base/*.cpp", "math/*.cpp", "navmesh/*.cpp", "network/*.cpp", "physics/*.cpp", "physics3d/*.cpp", "platform/*.cpp", "renderer/*.cpp", "renderer/backend/*.cpp", "ui/*.cpp", "axmol.cpp")

    if is_os("linux") then
        add_files("platform/linux/*.cpp", "platform/desktop/*.cpp")
    end
    if is_os("windows") then
        add_files("platform/win32/*.cpp", "platform/desktop/*.cpp")
    end

    if is_os("linux") or is_os("android") or is_os("windows") then
        add_files("renderer/backend/opengl/*.cpp")
    else
        add_files("renderer/backend/metal/*.mm")
    end

    add_packages(
        "astc",
        "bullet3",
        "chipmunk2d",
        "clipper2",
        "freetype",
        "glad",
        "libjpeg",
        "libogg",
        "libpng",
        "libvorbis",
        "libwebp",
        "llhttp",
        "lz4",
        "minimp3",
        "mio",
        "mz12",
        "openal-soft",
        "poly2tri",
        "pugixml",
        "rapidjson",
        "recastnavigation",
        "robin-map",
        "stb",
        "uthash",
        "xsbase",
        "xxhash",
        "yasio",
        {public=true}
        )

    if is_os("linux") then
        add_packages("fontconfig", "glfw", {public=true})
    end
