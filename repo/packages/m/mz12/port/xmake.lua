target("mz12")
    set_kind("$(kind)")
    add_files("crypt.c", "ioapi_mem.c", "ioapi.c", "unzip.c")
    add_headerfiles("crypt.h", "ioapi_mem.h", "ioapi.h", "unzip.h")
