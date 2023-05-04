require("nvim-treesitter.configs").setup {
    ensure_installed = {

        -- Web
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",

        -- Functional
        "rust",
        "c",
        "zig",
        "go",

        -- Git
        "git_config",
        "gitcommit",
        "git_rebase",
        "gitattributes",
        "gitignore",

        "json",
        "yaml",
        "toml",
        "markdown",

        "python",
        "lua",
        "bash",
    },

    auto_install = true,

    -- highlight = {
    --   enable = true,
    --   additional_vim_regex_highlighting = false,
    -- },
}
