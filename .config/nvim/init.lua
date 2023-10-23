-- Globals
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.python3_host_prog = '/usr/bin/python3'

-- Bootstrap Lazy
--    https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require('plugins.init')

-- Options
require('options.init')

-- Keymaps
require('keymaps.init')

