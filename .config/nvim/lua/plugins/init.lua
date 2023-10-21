require('lazy').setup(
  {
    -- Theme
    require('plugins.theme'),

    -- Git local integration
    'tpope/vim-fugitive',

    --  Github integration
    'tpope/vim-rhubarb',

    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    -- Automatically configures lua-language-server, Neovim API integration
    {'folke/neodev.nvim', opts = {} },

    -- Tabs for buffers
    'romgrk/barbar.nvim',

    -- Useful plugin to show you pending keybinds.
    { 'folke/which-key.nvim', opts = {} },

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },

    -- NVIM Neo Tree
    {
      'nvim-neo-tree/neo-tree.nvim',
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
    },

    -- Indent Blankline
    {
      'lukas-reineke/indent-blankline.nvim',
      main = "ibl",
      opts = {
        indent = { char = '┊' },
      },
    },

    -- Autocompletion
    require('plugins.cmp'),

    -- Git Integrations
    require('plugins.git'),

    -- LSP and Mason
    require('plugins.lsp-mason'),

    -- Statusline
    require('plugins.lualine'),

    -- Telescope
    require('plugins.telescope'),

    -- Treesitter
    require('plugins.treesitter')
  },

  {}
)
