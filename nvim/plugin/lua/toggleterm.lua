require("toggleterm").setup{
    hide_numbers = true,
    start_in_insert = true,
    terminal_mappings = true,
    persist_size = true,
    persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
    direction = 'vertical',
    close_on_exit = true,
    shell = "zsh",
    float_opts = {
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = "curved",
        winblend = 0,
        width = 130,
        height = 130,
    }
}
