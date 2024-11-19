require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'morhetz/gruvbox'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'tpope/vim-surround'
    use 'raimondi/delimitmate'
    use 'prabirshrestha/asyncomplete.vim'
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'
    use 'nvim-treesitter/nvim-treesitter'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
    use 'tpope/vim-commentary'
    use {'CopilotC-Nvim/CopilotChat.nvim', branch = 'canary', requires =  {'nvim-lua/plenary.nvim'}}
    use 'preservim/nerdtree'
    use 'vimwiki/vimwiki'
    use 'williamboman/mason.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'tpope/vim-fugitive'
    
end)
