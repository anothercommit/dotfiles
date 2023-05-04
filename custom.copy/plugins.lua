---@type NvPluginSpec[]
local plugins = {
    -- {
    --   "nvim-treesitter/nvim-treesitter",
    --   config = function()
    --     require "custom.configs.treesitter"
    --   end,
    -- },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        config = function()
            require "custom.configs.lspconfig"
            require "custom.configs.null-ls"
        end,
    },
    {
        "phaazon/hop.nvim",
        cmd = {
            "HopAnywhere",
            "HopWord",
            "HopChar2",
            "HopLineStart",
        },
        config = function()
            require("hop").setup()
        end,
    },
    -- To make a plugin not be loaded
    -- {
    --   "NvChad/nvim-colorizer.lua",
    --   enabled = false
    -- },
}

return plugins
