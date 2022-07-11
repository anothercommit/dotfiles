require'nvim-treesitter.configs'.setup {

  ensure_installed = { "lua", "rust", "vim" },
  auto_install = true,

  highlight = {

    enable = true,
    additional_vim_regex_highlighting = false,

  },

  rainbow = {
    enable = true,
 
    -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    extended_mode = true, 
    max_file_lines = nil, 
  }
}
