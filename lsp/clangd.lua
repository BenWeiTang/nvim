return {
    cmd = { require("project-env-config").GetIsUnrealProject()
        and "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\Llvm\\x64\\bin\\clangd.exe"
        or "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
    },
    root_markers = { "compile_commands.json", "compile_flags.txt" },
    filetypes = { "c", "cpp" },
}
