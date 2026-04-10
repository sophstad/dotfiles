local opt = vim.opt
opt.termguicolors = true
opt.signcolumn = "yes:1"
opt.ignorecase = true
opt.smartcase = true
opt.swapfile = false
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.cursorline = true
opt.scrolloff = 8
opt.inccommand = "nosplit"
opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
opt.undofile = true
opt.completeopt = { "menuone", "popup", "noinsert" }
opt.hlsearch = false
opt.clipboard = "unnamedplus"

vim.diagnostic.config({ virtual_text = true })

vim.cmd.colorscheme('tomorrow-night')

vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/echasnovski/mini.pairs' },
  { src = 'https://github.com/windwp/nvim-ts-autotag' },
  { src = 'https://github.com/ibhagwan/fzf-lua' },
})

require('nvim-treesitter').setup({})
require('nvim-treesitter').install({
  'tsx', 'typescript', 'javascript', 'go',
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

require('mini.pairs').setup()
require('fzf-lua').setup()

vim.keymap.set('n', '<leader>p', require('fzf-lua').files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>g', require('fzf-lua').live_grep, { desc = 'Grep project' })
vim.keymap.set('n', '<leader>b', require('fzf-lua').buffers, { desc = 'Switch buffer' })
vim.keymap.set('n', '<leader>?', require('fzf-lua').keymaps, { desc = 'Search keymaps' })
require('nvim-ts-autotag').setup()

vim.lsp.enable({"gopls", "tsgo"})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.lsp.completion.enable(true, args.data.client_id, args.buf, {
      autotrigger = true,
    })
  end,
})

vim.keymap.set('n', '<leader>o', function()
  local file = vim.fn.expand('%')
  local line = vim.fn.line('.')
  vim.system({ 'gh', 'browse', file .. ':' .. line })
end, { desc = 'Open in GitHub' })

vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'LSP rename' })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.format({ async = true })
end, { desc = 'Format file' })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
