return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      -- PDF viewer
      vim.g.vimtex_view_method = "zathura" -- supported by VimTeX :contentReference[oaicite:4]{index=4}

      -- Use LuaLaTeX by default
      vim.g.vimtex_compiler_latexmk_engines = {
        _ = "-lualatex", -- "_" is the default engine slot :contentReference[oaicite:5]{index=5}
        out_dir = "",
        aux_dir = "build",
      }
    end,
  },
}
