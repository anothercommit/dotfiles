vim.keymap.set("n", "<F5>", "<cmd> lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", "<cmd> lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", "<cmd> lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", "<cmd> lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<Leader>b", "<cmd> lua require'dap'.toggle_breakpoint()<CR>")

local dap = require('dap')
-- dap.adapters.lldb = {
--   type = 'executable',
--   command = '/usr/bin/lldb-vscode',
--   name = 'lldb'
-- }
dap.configurations.rust= {

}

require'dapui'.setup{}
