return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default",
      -- Map <C-l> to manually trigger the completion menu
      ["<C-l>"] = { "show", "show_documentation", "hide_documentation" },
    },
  },
}
