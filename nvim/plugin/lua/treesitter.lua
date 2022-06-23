require'nvim-treesitter.configs'.setup {
    
  ensure_installed = { "c_sharp", "c", "lua", "vim", "markdown", "json", "html", "javascript", "typescript", "rust", "fish" },

  sync_install = false,

  highlight = {
    enable = true,
  },
}
