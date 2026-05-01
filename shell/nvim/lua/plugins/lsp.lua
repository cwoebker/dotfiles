return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "vtsls",
        "pyright",
        "gopls",
        "bashls",
        "jsonls",
        "yamlls",
        "marksman",
      },
    },
  },
}
