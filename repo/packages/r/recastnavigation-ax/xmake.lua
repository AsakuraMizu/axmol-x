package("recastnavigation-ax")
    set_base("recastnavigatoin")

    set_urls("https://github.com/recastnavigation/recastnavigation.git")
    add_versions("main", "b43c82c8087f7e277077dcb7cb1e6c626d5550ce")
    add_patches("main", path.join(os.scriptdir(), "main.patch"), "fec38b58bae2b5d61c1e5a9b5a396971304b0f6228c7762b958c21c3e56bad04")
    add_links("DebugUtils", "DetourCrowd", "DetourTileCache", "Detour", "Recast")
    
    on_install(function (package)
        local configs = {}
        if package:config("shared") then
            configs.kind = "shared"
        end
        os.cp(path.join(package:scriptdir(), "port", "xmake.lua"), "xmake.lua")
        import("package.tools.xmake").install(package, configs)
    end)
