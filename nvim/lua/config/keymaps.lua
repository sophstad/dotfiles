local map = vim.keymap.set
local fzf = require("fzf-lua")

map("n", "<leader>p", fzf.files, { desc = "Find files" })
map("n", "<leader>g", fzf.live_grep, { desc = "Grep project" })
map("n", "<leader>b", fzf.buffers, { desc = "Switch buffer" })
map("n", "<leader>?", fzf.keymaps, { desc = "Search keymaps" })

map("n", "<leader>o", function()
  local file = vim.fn.expand("%")
  local line = vim.fn.line(".")
  vim.system({ "gh", "browse", file .. ":" .. line })
end, { desc = "Open in GitHub" })

map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP rename" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format file" })
