local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local bufopts = { noremap=true, silent=true, buffer=bufnr }


local lspkind = require('lspkind')
local nvim_lsp = require'lspconfig'
local cmp = require'cmp'


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

-- local kind_icons = {
-- 	Text = "",
-- 	Method = "",
-- 	Function = "",
-- 	Constructor = "",
-- 	Field = "",
-- 	Variable = "",
-- 	Class = "",
-- 	Interface = "",
-- 	Module = "",
-- 	Property = "",
-- 	Unit = "",
-- 	Value = "",
-- 	Enum = "",
-- 	Keyword = "",
-- 	Snippet = "",
-- 	Color = "",
-- 	File = "",
-- 	Reference = "",
-- 	Folder = "",
-- 	EnumMember = "",
-- 	Constant = "",
-- 	Struct = "",
-- 	Event = "",
-- 	Operator = "",
-- 	TypeParameter = "",
-- }

formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      menu = {
          buffer = "[txt]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[api]",
          path = "[path]",
          luasnip = "[snip]",
      },
      before = function (entry, vim_item)
        return vim_item
      end
    }),
}

cmp.setup({

snippet = {
  expand = function(args)
    require('luasnip').lsp_expand(args.body)
  end,
},

experimental = {
    ghost_text = true,
},

window = {
  completion = cmp.config.window.bordered(),
  documentation = cmp.config.window.bordered(),
},

mapping = cmp.mapping.preset.insert({
  ["<M-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
  ["<M-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  -- ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<M-Space>'] = cmp.mapping.confirm({ select = true }), 
}),

sources = cmp.config.sources(
{
  { name = 'nvim_lua' },
  { name = 'nvim_lsp' },
  { name = 'path' },
  { name = 'luasnip' },
  { name = 'buffer', keyword_lenght = 5 },
})
})
