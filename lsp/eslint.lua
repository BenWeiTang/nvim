return {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = { "javascript", "typescript", "vue" },
  root_markers = { "eslint.config.js", "package.json" },
  workspace_required = true,

  -- The values in settings are copied from https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#eslint
  -- The only thing that I changed wsa to set useFlatConfig to true as that's what we use in Vue 3 and ESLint 9+.
  -- It seems to me that if the settings are not specified, eslint-lsp won't work. Idk which specific properties are
  -- required to have it up and running though.
  settings = {
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine"
      },
      showDocumentation = {
        enable = true
      }
    },
    codeActionOnSave = {
      enable = false,
      mode = "all"
    },
    experimental = {
      useFlatConfig = true
    },
    format = true,
    nodePath = "",
    onIgnoredFiles = "off",
    problems = {
      shortenToSingleLine = false
    },
    quiet = false,
    rulesCustomizations = {},
    run = "onType",
    useESLintClass = false,
    validate = "on",
    workingDirectory = {
      mode = "auto"
    }
  },
}
