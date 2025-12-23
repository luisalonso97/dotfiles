local M = {}

local function norm(p)
  return vim.fs.normalize(vim.fn.expand(p))
end

local allowlist = {
  "~/dotfiles",
  "~/.config/nvim",
}

function M.allow(cwd)
  cwd = norm(cwd)
  for _, p in ipairs(allowlist) do
    p = norm(p)
    if cwd:sub(1, #p) == p then
      return true
    end
  end
  return false
end

return M
