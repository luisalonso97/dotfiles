-- More harmonized warm palette (keeps the red/yellow feel)
local LITERAL_LAVENDER = "#9b90ff" -- was #8e82fe, nudged slightly toward the same “family”
local FUNCTION_GOLD    = "#f5df76" -- was #fdfd96 (less pastel/neon, more “gold”)
local STRING_ROSE      = "#ff7d8a" -- was #F8858B (slightly cleaner / more consistent)
local KEYWORD_BRICK    = "#d4534e" -- was #db4f4d (tiny shift to reduce harshness)
local BUILTIN_AMBER    = "#f2c65e" -- was #ffdb58 (less “highlighter”, more amber)
local BUILTIN_ORANGE   = "#f09a49" -- replaces #E54C38 (this is now truly a warm orange accent)

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
        base05 = "#ffffff", -- Default foreground
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
