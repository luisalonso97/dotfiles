-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- VimTeX compile toggle (buffer-local, only for .tex files)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function(ev)
    vim.keymap.set("n", "<localleader>c", "<cmd>VimtexCompile<cr>", {
      buffer = ev.buf,
      desc = "VimTeX: Toggle compile",
    })
  end,
})


-- =====REMAPS=====
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

-- Also commonly-overlooked delete/replace keys:
vim.keymap.set("n", "s", '"_s', keymap_remap_opts)
vim.keymap.set("n", "S", '"_S', keymap_remap_opts)

-- Visual mode
vim.keymap.set("x", "d", '"_d', keymap_remap_opts)
vim.keymap.set("x", "c", '"_c', keymap_remap_opts)
