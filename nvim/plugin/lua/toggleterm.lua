require("toggleterm").setup{
    hide_numbers = true,
    start_in_insert = true,
    terminal_mappings = true,
    persist_size = true,
    persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
    direction = 'float',
    close_on_exit = true,
    shell = "zsh",
    float_opts = {
        -- see :h nvim_open_win for details on borders however
        border = "curved",
        winblend = 0,
        width = 130,
        height = 130,
    }
}
