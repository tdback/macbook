local vim = vim

local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')

local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- make it pretty
	use({'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	})
	use({'kdheepak/tabline.nvim',
		requires = { { 'hoob3rt/lualine.nvim', opt = true }, {'kyazdani42/nvim-web-devicons', opt = true} }
	})
	use('nvim-lua/plenary.nvim')
	use('nvim-telescope/telescope.nvim')
	use('mhinz/vim-startify')
	use('ryanoasis/vim-devicons')
	use('scrooloose/nerdtree')
	use('preservim/nerdcommenter')
	use({'nvim-treesitter/nvim-treesitter', 
		run = ":TSUpdate"
	})
	use('jiangmiao/auto-pairs')
	use('folke/tokyonight.nvim')

	-- completion section
	use('neovim/nvim-lspconfig')
	use('hrsh7th/cmp-nvim-lsp')
	use('hrsh7th/cmp-buffer')
	use('hrsh7th/cmp-path')
	use('hrsh7th/cmp-cmdline')
	use('hrsh7th/nvim-cmp')
	use('hrsh7th/cmp-vsnip')
	use('hrsh7th/vim-vsnip')

	-- tools and such
	use('simrat39/rust-tools.nvim')

	-- Lisp REPL 
	use('Olical/conjure')
	use('wlangstroth/vim-racket')

	-- Elixir Support
	use('elixir-editors/vim-elixir')

end)
