local LITERAL_LAVENDER = "#9b90ff"
local FUNCTION_GOLD    = "#f5df76"
local STRING_ROSE      = "#ff7d8a"
local KEYWORD_BRICK    = "#d4534e"
local BUILTIN_AMBER    = "#f2c65e"
local BUILTIN_ORANGE   = "#f09a49"

return {
  {
    "bjarneo/aether.nvim",
    name = "aether",
    priority = 1000,
    opts = {
      disable_italics = false,
      colors = {
        -- Monotone shades (base00-base07) - smoother, usable steps
        base00 = "#271517", -- Default background
        base01 = "#a18084", -- Lighter background (status bars)
        base02 = "#271517", -- Selection background
        base03 = "#a18084", -- Comments, invisibles
        base04 = "#FFFFFF", -- Dark foreground
        base05 = "#ffffff", -- Default foreground, normal text
        base06 = "#ffffff", -- Light foreground
        base07 = "#FFFFFF", -- Light background

        -- Accents (base08-base0F) - unified warm family + one cool counterpoint
        base08 = FUNCTION_GOLD,    -- functions/calls (your “hero” color)
        base09 = LITERAL_LAVENDER, -- numbers/constants
        base0A = STRING_ROSE,      -- types/classes (warm pink/rose)
        base0B = FUNCTION_GOLD,    -- strings (kept warm/golden per your vibe)
        base0C = BUILTIN_AMBER,    -- builtins/support
        base0D = BUILTIN_ORANGE,   -- “active” accent (operators/specials/etc.)
        base0E = KEYWORD_BRICK,    -- keywords
        base0F = LITERAL_LAVENDER, -- extra accent slot
      },
    },
    config = function(_, opts)
      require("aether").setup(opts)
      vim.cmd.colorscheme("aether")
      require("aether.hotreload").setup()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "aether" },
  },
}
