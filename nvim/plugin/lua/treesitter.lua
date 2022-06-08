require'nvim-treesitter.configs'.setup {
    
  -- A list of parser names, or "all"
  ensure_installed = { "norg","c_sharp", "c", "lua", "vim", "markdown", "json", "html", "javascript" },

  sync_install = false,

  highlight = {
    enable = true,
  },
}
