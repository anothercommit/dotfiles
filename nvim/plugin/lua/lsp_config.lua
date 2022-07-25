local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local bufopts = { noremap=true, silent=true, buffer=bufnr }

local nvim_lsp = require'lspconfig'


require'lspconfig'.bashls.setup{
    capabilities = capabilities,
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "<Leader>dj", vim.diagnostic.goto_next, bufopts)
        vim.keymap.set("n", "<Leader>dk", vim.diagnostic.goto_prev, bufopts)
        vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", bufopts)
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<Leader>cf", vim.lsp.buf.formatting, bufopts)
    end,
}

require'lspconfig'.rust_analyzer.setup
{
    capabilities = capabilities,
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "<Leader>dj", vim.diagnostic.goto_next, bufopts)
        vim.keymap.set("n", "<Leader>dk", vim.diagnostic.goto_prev, bufopts)
        vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", bufopts)
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<Leader>a", vim.lsp.buf.formatting, bufopts)
    end,
}

-- require'lspconfig'.sumneko_lua.setup
-- {
--     capabilities = capabilities,
--     on_attach = lsp_on_attach,
-- }
