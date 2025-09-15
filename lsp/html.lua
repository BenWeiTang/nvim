return {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html", "templ", "vue" },
    init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true,
            typescript = true,
        },
        provideFormatter = true
    },
    root_markers = { "package.json", ".git" }
}
