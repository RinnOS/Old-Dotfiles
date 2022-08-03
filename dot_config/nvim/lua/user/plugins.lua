local fn = vim.fn

-- Automaticall install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer, close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save this file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

-- Install plugins here
return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- So packer auto updates
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
 
  use 'tpope/vim-commentary' -- Commenting with gcc & gc
  use 'ap/vim-css-color'
  use 'ryanoasis/vim-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'rcarriga/nvim-notify'
  use 'glepnir/dashboard-nvim'
  use 'kyazdani42/nvim-tree.lua'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'p00f/nvim-ts-rainbow'
  use 'andweeb/presence.nvim'

  -- Themes
  use 'yashguptaz/calvera-dark.nvim'
  use 'tiagovla/tokyodark.nvim'
  use 'shaunsingh/moonlight.nvim'
  use 'bluz71/vim-moonfly-colors'
  use 'rafamadriz/neon'

  -- CMP
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  -- Snippet
  use 'l3mon4d3/luasnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Keep this at the bottom, below all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
