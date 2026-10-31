-- Must be set before any keymaps are defined.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Must be registered before vim.pack.add so it fires on first install.
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    if ev.data.spec.name == "nvim-treesitter" and ev.data.kind ~= "delete" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/echasnovski/mini.pairs",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/folke/which-key.nvim",
})

require("config")
