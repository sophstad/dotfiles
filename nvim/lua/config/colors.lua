-- Inherit colors from the terminal palette (ANSI indices, no hex).
vim.opt.termguicolors = false

local function apply_ansi_highlights()
  local ansi = {
    ["@comment"] = 8,
    ["@keyword"] = 5,
    ["@string"] = 2,
    ["@string.regexp"] = 6,
    ["@string.escape"] = 6,
    ["@number"] = 6,
    ["@boolean"] = 6,
    ["@constant"] = 6,
    ["@function"] = 4,
    ["@type"] = 3,
    ["@attribute"] = 3,
    ["@tag"] = 1,
    ["@tag.attribute"] = 3,
    ["@variable.builtin"] = 1,
  }
  for group, color in pairs(ansi) do
    vim.api.nvim_set_hl(0, group, { ctermfg = color })
  end
end

vim.api.nvim_create_autocmd("ColorScheme", { callback = apply_ansi_highlights })
vim.cmd("colorscheme default")
