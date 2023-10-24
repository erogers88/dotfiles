return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          header = {
              [[                                                                       ]],
              [[  ██████   █████                   █████   █████  ███                  ]],
              [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
              [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
              [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
              [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
              [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
              [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
              [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
              [[                                                                       ]],
              "",
              "",
            },
          shortcut = {
            { desc = '📦 Lazy', group = '@property', action = 'Lazy', key = 'l' },
            { desc = '🛠 Mason', group = 'Number', action = 'Mason', key = 'm' },
            { desc = '󰏓  Filetree', group = 'Label', action = 'Neotree action=focus source=filesystem position=float toggle=true', key = 't' },
            { desc = '🔍 Find Files', group = 'Label', action = 'Telescope find_files', key = 'f' },
          },
          project = { enable = true, limit = 8, icon = '󰏓', label = '  Recent Folders', action = 'Telescope find_files cwd=' },
          mru = { limit = 10, icon = '', label = '  Recent Files', },
          footer = {
            "",
          }
        }
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },

}
