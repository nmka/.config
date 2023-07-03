local dap = require("dap")

dap.adapters.coreclr = {
  type = "executable",
  command = "/usr/local/netcoredbg",
  args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
    end,
  },
}

local keymap = vim.keymap
keymap.set("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>")
keymap.set("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>")
keymap.set("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>")
keymap.set("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>")
keymap.set("n", "<leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
keymap.set("n", "<leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
keymap.set("n", "<leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
keymap.set("n", "<leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>")
keymap.set("n", "<Cmd>lua require'dap'.run_last()<CR>", "<leader>dl")

vim.api.nvim_set_hl(0, "blue", { fg = "#65D1FF" })
vim.api.nvim_set_hl(0, "green", { fg = "#3EFFDC" })
vim.api.nvim_set_hl(0, "yellow", { fg = "#FFDA7B" })
vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" })
vim.api.nvim_set_hl(0, "violet", { fg = "#FF61EF" })

vim.fn.sign_define(
  "DapBreakpoint",
  { text = "●", texthl = "blue", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
  "DapBreakpointCondition",
  { text = "●", texthl = "blue", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
  "DapBreakpointRejected",
  { text = "●", texthl = "orange", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define("DapStopped", { text = "•", texthl = "green", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
vim.fn.sign_define(
  "DapLogPoint",
  { text = "●", texthl = "yellow", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
