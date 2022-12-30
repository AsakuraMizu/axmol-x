add_rules("mode.debug", "mode.release")

target("glad")
    set_kind("$(kind)")
    add_includedirs("include")
    add_files("src/gl.c")
    add_headerfiles("include/(glad/gl.h)", "include/(KHR/khrplatform.h)")
