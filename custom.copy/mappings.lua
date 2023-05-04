---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["h"] = "",
    ["j"] = "",
    ["k"] = "",
    ["l"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>y"] = { '"+y', "yank to clipbaord", opts = { nowait = true } },
    ["<leader>z"] = { "za", "toggle fold", opts = { nowait = true } },
    ["<A-j>"] = { "<cmd>m .+1<CR>", "move oneline down", opts = { nowait = true } },
    ["<A-k>"] = { "<cmd>m .-2<CR>", "move one line up", opts = { nowait = true } },
    ["<leader><leader>"] = { "<cmd>HopWord<CR>", "HopWord", opts = { nowait = true } },
    ["<leader>;"] = { "<cmd>HopChar2<CR>", "HopChar2", opts = { nowait = true } },
  },
  v = {
    ["<leader>y"] = { '"+y', "yank to clipbaord", opts = { nowait = true } },
  },
  i = {
    ["jk"] = { "<esc>", "Pasar a modo normal en insert-mode", opts = { nowait = true } },
  },
}

return M
