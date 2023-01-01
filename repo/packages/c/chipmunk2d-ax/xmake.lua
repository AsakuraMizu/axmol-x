package("chipmunk2d-ax")

    set_base("chipmunk2d")
    add_patches("7.0.3", path.join(os.scriptdir(), "patches", "axmol.patch"), "8079818ed42d9f27d38981542286722c5f87654a3eead52a66b0bd97ac5f816b")
