-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Catppucin Theme
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Lualine
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Bufferline
  use {
      'akinsho/bufferline.nvim', 
      tag = "*", 
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Oil file browser
  use({
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  })

  -- Telescope
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }

  -- Harpoon
  use 'theprimeagen/harpoon'

  -- VIM fugitive
  use ( 'tpope/vim-fugitive' )

  -- CMP
  use {
      'hrsh7th/nvim-cmp',
      required = {
          'hrsh7th/cmp-buffer',     -- Source for words in the current buffer
          'hrsh7th/cmp-path',       -- Source for file system paths
          'hrsh7th/cmp-nvim-lsp',   -- Source for LSP suggestions
      }
  }

  -- CMake Tools
  use 'Civitasv/cmake-tools.nvim'

  -- Mason
  use 'mason-org/mason-lspconfig.nvim'

  use { 
      'mason-org/mason.nvim',
      required = {
          'mason-org/mason-lspconfig.nvim'
      }
  }
end)
