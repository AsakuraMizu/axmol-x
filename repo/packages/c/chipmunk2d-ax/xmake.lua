package("chipmunk2d-ax")

    set_base("chipmunk2d")
    add_patches("7.0.3", path.join(os.scriptdir(), "patches", "7.0.3", "axmol.patch"), "8079818ed42d9f27d38981542286722c5f87654a3eead52a66b0bd97ac5f816b")
    add_patches("7.0.3", path.join(os.scriptdir(), "patches", "7.0.3", "android.patch"), "08e80020880e9bf3c61b48d41537d953e7bf6a63797eb8bcd6b78ba038b79d8f")
