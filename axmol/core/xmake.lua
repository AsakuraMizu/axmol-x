add_requires(
    "astc-encoder",
    "bullet3",
    "clipper2",
    "freetype",
    "glad",
    "libcurl",
    "libjpeg",
    "libogg",
    "libpng",
    "libvorbis",
    "libwebp",
    "llhttp",
    "lz4",
    "minimp3",
    "mz12",
    "openal-soft",
    "poly2tri",
    "rapidjson v1.1.0",
    "stb",
    "uthash",
    "xsbase",
    "xxhash",
    "yasio")
add_requires("chipmunk2d-ax", {alias="chipmunk2d"})
add_requires("glfw-ax", {alias="glfw"})
add_requires("mio-ax", {alias="mio"})
add_requires("openssl3", {alias="openssl"})
add_requires("pugixml-ax v1.12.1", {alias="pugixml"})
add_requires("recastnavigation-ax main", {alias="recastnavigation"})
add_requires("robin-map-ax", {alias="robin-map"})

if is_os("linux") then
    add_requires("fontconfig")
end
if is_os("windows") then
    add_requires("ntcvt")
end

target("axmol")
    set_kind("static")
    add_includedirs(".", "platform", {public=true})
    add_defines("AX_STATIC", {public=true})

    add_files("2d/*.cpp", "3d/*.cpp", "audio/*.cpp", "base/*.cpp|CCController-*", "math/*.cpp", "navmesh/*.cpp", "network/*.cpp", "physics/*.cpp", "physics3d/*.cpp", "platform/*.cpp", "renderer/*.cpp", "renderer/backend/*.cpp", "ui/*.cpp", "axmol.cpp")

    if is_os("linux") or is_os("windows") then
        add_files("base/CCController-linux-win32.cpp")
    elseif is_os("android") then
        add_files("base/CCController-android.cpp")
    else
        add_files("base/CCController-apple.mm")
    end

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
        "astc-encoder",
        "bullet3",
        "chipmunk2d",
        "clipper2",
        "freetype",
        "glad",
        "glfw",
        "libcurl",
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
        "openssl",
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
        add_packages("fontconfig", {public=true})
    end
    if is_os("windows") then
        add_packages("ntcvt", {public=true})
        add_links("Version")
    end
