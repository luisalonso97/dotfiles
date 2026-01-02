-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ================================== AutoCMDs =================================
-- * VimTeX compile toggle (buffer-local, only for .tex files)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function(ev)
    vim.keymap.set("n", "<localleader>c", "<cmd>VimtexCompile<cr>", {
      buffer = ev.buf,
      desc = "VimTeX: Toggle compile",
    })
  end,
})

-- ================================== Remaps ===================================
local keymap_remap_opts = { noremap = true, silent = true }

-- * No delete into unnamed registry
--   Remap deletion-like keys to send text to the unnamed registry to avoid
--   messing with the text in the clipboard registry.
--
-- Normal mode
vim.keymap.set("n", "d", '"_d', keymap_remap_opts)
vim.keymap.set("n", "D", '"_D', keymap_remap_opts)
vim.keymap.set("n", "dd", '"_dd', keymap_remap_opts)

vim.keymap.set("n", "c", '"_c', keymap_remap_opts)
vim.keymap.set("n", "C", '"_C', keymap_remap_opts)
vim.keymap.set("n", "cc", '"_cc', keymap_remap_opts)

vim.keymap.set("n", "x", '"_x', keymap_remap_opts)
vim.keymap.set("n", "X", '"_X', keymap_remap_opts)

-- Visual mode
vim.keymap.set("x", "d", '"_d', keymap_remap_opts)
vim.keymap.set("x", "c", '"_c', keymap_remap_opts)

-- * Do \ + r to do a search and replace in visual mode for selection.
vim.keymap.set("v", "<localleader>r", [["hy:%s/<C-r>h//gc<left><left><left>]], {
  noremap = true,
  silent = false,
  desc = "Substitute selected text (confirm)",
})

-- * Quickly do jj in insert mode to escape.
vim.keymap.set("i", "jj", "<ESC>", { silent = true })

-- * LuaSnip remaps
local ls = require("luasnip")

-- Cycle forward through choices
vim.keymap.set({ "i", "s" }, "<C-f>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { desc = "Snippet: Next choice", silent = true })

-- Cycle backward through choices
vim.keymap.set({ "i", "s" }, "<C-b>", function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end, { desc = "Snippet: Previous choice", silent = true })
