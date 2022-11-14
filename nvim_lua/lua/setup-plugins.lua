local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local status, _ = pcall(require, "packer")
if not status then
	return
end

return require('packer').startup(function(use)
  use ('wbthomason/packer.nvim')
  use ('ellisonleao/gruvbox.nvim')

  -- syntax highlight
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }

  -- Languages support
  use ('neovim/nvim-lspconfig')
  use ('hrsh7th/cmp-nvim-lsp')
  use ('hrsh7th/cmp-buffer')
  use ('hrsh7th/cmp-path')
  use ('hrsh7th/cmp-cmdline')
  use ('hrsh7th/nvim-cmp')
  use ('saadparwaiz1/cmp_luasnip') -- Snippets source for nvim-cmp
  use ('L3MON4D3/LuaSnip') -- Snippets plugin

  -- Editorconfig
  use ('editorconfig/editorconfig-vim');

  -- Prettier
  use {
    'prettier/vim-prettier',
    run = 'yarn install --frozen-lockfile --production',
  }

  -- Undotree
  use ('mbbill/undotree')

  -- Auto pairs
   use ('jiangmiao/auto-pairs')

  -- Comments
  use ('tpope/vim-commentary')

  -- Surround
  use ('tpope/vim-surround')

  -- Emmet
  use ('mattn/emmet-vim')

  -- Close Tag
  use ('alvan/vim-closetag')

  -- Colors highlight
  use ('ap/vim-css-color')

  -- JsDoc
  use ('heavenshell/vim-jsdoc')

  -- Telescope
  use ('nvim-lua/plenary.nvim')
  use ('nvim-telescope/telescope.nvim')
  use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make'
  }

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


