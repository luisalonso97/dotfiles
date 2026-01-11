-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local group = vim.api.nvim_create_augroup("vimtex_autoclean", { clear = true })

vim.api.nvim_create_autocmd("User", {
  group = group,
  pattern = "VimtexEventCompileStopped",
  callback = function()
    vim.cmd("silent! VimtexClean")
  end,
})

local function to_hex(c)
  if not c then return nil end
  if type(c) == "number" then
    return string.format("#%06x", c)
  end
  return c
end

local function hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

local function rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x", r, g, b)
end

local function blend(a, b, alpha)
  a, b = to_hex(a), to_hex(b)
  if not a or not b then return a or b end
  local ar, ag, ab = hex_to_rgb(a)
  local br, bg, bb = hex_to_rgb(b)
  local r = math.floor(ar + (br - ar) * alpha + 0.5)
  local g = math.floor(ag + (bg - ag) * alpha + 0.5)
  local bl = math.floor(ab + (bb - ab) * alpha + 0.5)
  return rgb_to_hex(r, g, bl)
end

local function set_lighter_cursorword()
  local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
  local visual = vim.api.nvim_get_hl(0, { name = "Visual", link = false })

  local visual_bg = visual.bg
  if visual.reverse or not visual_bg then
    visual_bg = normal.fg
  end

  local LIGHTEN = 0.10
  local lighter_bg = blend(visual_bg, "#ffffff", LIGHTEN)

  -- Define our custom group
  vim.api.nvim_set_hl(0, "CursorWordLikeVisual", { bg = lighter_bg })

  -- Point all the “cursor word / references” groups at it
  vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "CursorWordLikeVisual" })
  vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "CursorWordLikeVisual" })
  vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "CursorWordLikeVisual" })

  vim.api.nvim_set_hl(0, "LspReferenceText", { link = "CursorWordLikeVisual" })
  vim.api.nvim_set_hl(0, "LspReferenceRead", { link = "CursorWordLikeVisual" })
  vim.api.nvim_set_hl(0, "LspReferenceWrite", { link = "CursorWordLikeVisual" })

  vim.api.nvim_set_hl(0, "MiniCursorword", { link = "CursorWordLikeVisual" })
  vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { link = "CursorWordLikeVisual" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_lighter_cursorword,
})

set_lighter_cursorword()
