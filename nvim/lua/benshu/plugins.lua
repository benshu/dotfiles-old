vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  use {'andymass/vim-matchup', event = 'VimEnter *'}
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex', 'py', 'yaml', 'lua'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  use {
	  'nvim-telescope/telescope.nvim',
	  requires = {
          {'nvim-lua/popup.nvim'},
          {'nvim-lua/plenary.nvim'}
      }
  }
  use {
      'nvim-telescope/telescope-github.nvim',
      config = function()
          require('telescope').load_extension('gh')
      end
  }
  use {'nvim-treesitter/nvim-treesitter', opt = true}

  use {
    'nvim-lua/completion-nvim',
    requires = {
        { 'hrsh7th/vim-vsnip', opt = true },
        { 'hrsh7th/vim-vsnip-integ', opt = true },
    }
  }
  -- LSP {{{
  use 'neovim/nvim-lspconfig'
  use 'wbthomason/lsp-status.nvim'
  use 'anott03/nvim-lspinstall'
  -- }}}

  use {
      'brooth/far.vim',
      config = function()
          vim.g['far#source'] = 'rgnvim'
          vim.g['far#limit'] = 10000
          vim.g['far#ignore_files'] = {
              '/home/hagay/.local/share/nvim/site/pack/packer/start/far.vim/farignore',
              './.gitignore',
              './.rgignore',
          }
          -- vim.cmd [[let g:far#source='rgnvim']]
      end
  }

  -- use {'pwntester/octo.nvim',}
  use 'norcalli/nvim-colorizer.lua'
  use {'dracula/vim', as = 'dracula'}

  use 'godlygeek/tabular'        -- Quickly align text by pattern
  use 'tpope/vim-surround'       -- Surround text objects easily
  use 'tpope/vim-commentary'     -- Easily comment out lines or objects
  use 'tpope/vim-repeat'         -- Repeat actions better
  use 'tpope/vim-abolish'        -- Cool things with words!
  use 'tpope/vim-characterize'
  use 'AndrewRadev/splitjoin.vim'
  use 'christoomey/vim-tmux-navigator'
end)
