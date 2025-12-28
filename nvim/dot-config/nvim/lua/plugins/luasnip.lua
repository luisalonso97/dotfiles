return {
  "L3MON4D3/LuaSnip",
  opts = function()
    -- Find the project root (where .git is)
    local project_root = vim.fs.dirname(vim.fs.find({ ".git", ".vscode" }, { upward = true })[1])

    if project_root then
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { project_root .. "/.vscode" }
      })
    end
  end,
}
