require("nvim-treesitter").install({
  "bash", "css", "go", "javascript", "json", "tsx", "typescript", "yaml",
})

-- Start treesitter highlighting for any filetype with an installed parser.
vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
})
