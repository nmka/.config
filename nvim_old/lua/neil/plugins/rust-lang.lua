local rust_lang = {
  "rust-lang/rust.vim",
  ft = "rust",
  init = function()
    vim.g.rustfmt_autosave = 1
  end,
}

return rust_lang
