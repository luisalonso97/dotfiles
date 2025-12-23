return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>ff",
      function()
        local root = LazyVim.root({ normalize = true })
        Snacks.picker.files({
          cwd = root,
          hidden = require("config.hidden").allow(root),
          exclude = { "**/.git/**" },
        })
      end,
      desc = "Find Files (Root Dir)",
    },
    {
      "<leader>fF",
      function()
        local cwd = vim.fs.normalize((vim.uv or vim.loop).cwd() or ".")
        Snacks.picker.files({
          cwd = cwd,
          hidden = require("config.hidden").allow(cwd),
          exclude = { "**/.git/**" },
        })
      end,
      desc = "Find Files (cwd) test",
    },
  },
  opts = {
    scroll = {
      enabled = false, -- Disable scrolling animations
    },
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
        header = [[
 @@@@@@   @@@       @@@  @@@  @@@@@@@@@@   @@@  @@@  @@@  @@@  @@@  @@@@@@@@@@
@@@@@@@@  @@@       @@@  @@@  @@@@@@@@@@@  @@@  @@@@ @@@  @@@  @@@  @@@@@@@@@@@
@@!  @@@  @@!       @@!  @@@  @@! @@! @@!  @@!  @@!@!@@@  @@!  @@@  @@! @@! @@!
!@!  @!@  !@!       !@!  @!@  !@! !@! !@!  !@!  !@!!@!@!  !@!  @!@  !@! !@! !@!
@!@!@!@!  @!!       @!@  !@!  @!! !!@ @!@  !!@  @!@ !!@!  @!@  !@!  @!! !!@ @!@
!!!@!!!!  !!!       !@!  !!!  !@!   ! !@!  !!!  !@!  !!!  !@!  !!!  !@!   ! !@!
!!:  !!!  !!:       !!:  !!!  !!:     !!:  !!:  !!:  !!!  !!:  !!!  !!:     !!:
:!:  !:!   :!:      :!:  !:!  :!:     :!:  :!:  :!:  !:!  :!:  !:!  :!:     :!:
::   :::   :: ::::  ::::: ::  :::     ::    ::   ::   ::  ::::: ::  :::     ::
 :   : :  : :: : :   : :  :    :      :    :    ::    :    : :  :    :      :
]],
      },
    },
  },
}
