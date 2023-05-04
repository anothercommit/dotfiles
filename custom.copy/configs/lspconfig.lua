-- local on_attach = require("plugins.configs.lspconfig").on_attach
-- local capabilities = require("plugins.configs.lspconfig").capabilities
--
-- local lspconfig = require "lspconfig"
--
-- local servers = mason-lspconfig.get_installed_servers()
--
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end

local mason = require "mason"
local mason_lspconfig = require "mason-lspconfig"

local lspconfig = require "lspconfig"

mason.setup()
mason_lspconfig.setup {
  ensure_installed = {
    -- Formaters
    -- "prettier",
    -- "stylua",
    -- "clangd-format",

    -- Web
    "html",
    "tsserver",
    "cssls",
    "denols",

    "marksman", -- Markdown
    "jsonls",
    "lua_ls",
    "pyre",
    "yamlls",
    "taplo",

    -- Functional
    "clangd",
    "rust_analyzer",
  },
}

require("mason-lspconfig").setup_handlers {
  function(server)
    lspconfig[server].setup {}
  end,
}
