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

--nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
keymap.set("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>")
--nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
keymap.set("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>")
--nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
keymap.set("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>")
--nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
keymap.set("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>")
--nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
keymap.set("n", "<leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
--nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
keymap.set("n", "<leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
--nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
keymap.set("n", "<leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
--nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
keymap.set("n", "<leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>")
--nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
keymap.set("n", "<Cmd>lua require'dap'.run_last()<CR>", "<leader>dl")
