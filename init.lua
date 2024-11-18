-- General settings

vim.o.syntax = "on"  -- Enable syntax highlighting
vim.o.filetype = "on"  -- Enable filetype detection
vim.o.termguicolors = true  -- Enable true colors
vim.o.number = true  -- Show line numbers
vim.o.relativenumber = true  -- Show relative line numbers
vim.o.background = "dark"  -- Set background color
vim.o.history = 10000  -- Set command history length
vim.o.undodir = vim.fn.expand("~/.vim/undodir")  -- Set undo directory
vim.o.undofile = true  -- Enable persistent undo
vim.o.swapfile = false
vim.o.undolevels = 10000
vim.o.encoding = "utf-8"
vim.o.hlsearch = false  -- Highlight search results
vim.o.incsearch = true  -- Incremental search
vim.o.spell = true  -- Disable spell check
vim.o.spelllang = "en_us"  -- Set spell check language
vim.o.wrap = true  -- Disable line wrapping
vim.o.colorcolumn = "80"

-- Tabs settings
vim.o.tabstop = 4  -- Number of spaces in a tab
vim.o.softtabstop = 0  -- Soft tab stop
vim.o.shiftwidth = 4  -- Number of spaces for auto-indent
vim.o.expandtab = true  -- Convert tabs to spaces

vim.cmd('colorscheme gruvbox')  -- Set color scheme

-- Set leader key
vim.g.mapleader = ','

-- Plugin setup using packer.nvim (assuming you use packer instead of vim-plug)
require('packer').startup(function(use)
    -- List your plugins here
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
    -- Nerdtree
    use 'preservim/nerdtree'
    use 'vimwiki/vimwiki'
    use 'williamboman/mason.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'tpope/vim-fugitive'
    

    -- Additional plugins can be added similarly
end)

-- Configurations
--
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
    },
})

vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- -- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
'force',
lspconfig_defaults.capabilities,
require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = {buffer = event.buf}

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end,
})

-- These are just examples. Replace them with the language
-- servers you have installed in your system
require('lspconfig').pyright.setup{}

local cmp = require('cmp')

cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({}),
})

require("mason").setup()

-- Lsp settings

vim.g.airline_powerline_fonts = 1  -- Enable powerline fonts

-- Change Airline icons
-- vim.g.airline_left_sep = ''
-- vim.g.airline_left_alt_sep = ''
-- vim.g.airline_right_sep = ''
-- vim.g.airline_right_alt_sep = ''


require("CopilotChat").setup {
    debug = true,
    mappings = {
        complete = {
            insert = "<C-Space>",
        },
    },
}

vim.g.ale_linters = {
    python = {'mypy', 'pylint'}
}

vim.g.ale_fixers = {
    python = {'black'}
}

require('dap-python').setup('python')

local dap = require 'dap'
dap.adapters.python = {
    type = 'executable';
    command = 'python';
    args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
    {
        type = 'python';
        request = 'launch';
        name = "Launch file";
        program = "${file}";
        console = "integratedTerminal";
    },
}

require('dapui').setup({
    syntax = {
        variables = { "source", "global" },
        visual = true
    },
    icons = {
        expanded = "▾",
        collapsed = "▸"
    },
    mappings = {
        expand = {"<CR>", "<2-LeftMouse>"},
        open = "o",
        remove = "d",
        edit = "e",
    },
    sidebar = {
        open_on_start = true,
        elements = {
            "scopes",
            "breakpoints",
            "stacks",
            "watches",
        },
        width = 40,
        position = "left"
    },
    tray = {
        open_on_start = true,
        elements = {
            "repl"
        },
        height = 10,
        position = "bottom"
    },
    floating = {
        max_height = nil,
        max_width = nil
    }
})

vim.g.vimwiki_list = {
    {
        path = '~/vimwiki/',
        syntax = 'markdown',
        ext = '.md',
    }
}


dap.listeners.after.event_initialized['dapui_config'] = function()
    require('dapui').open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
    require('dapui').close()
end


-- Mappings

-- Enable Copilot
vim.api.nvim_set_keymap('n', '<leader>cpo', ':Copilot enable<CR>', { noremap = true, silent = false })

-- Disable Copilot
vim.api.nvim_set_keymap('n', '<leader>cpd', ':Copilot disable<CR>', { noremap = true, silent = false })

-- Key mappings for fzf
vim.api.nvim_set_keymap('n', '<leader>f', ':Files<CR>', { noremap = true, silent = true })

-- Key mappings for run python file
vim.api.nvim_set_keymap('n', '<leader>r', ':!python %<CR>', { noremap = true, silent = true })

-- Key mapping for run current file with pytest
vim.api.nvim_set_keymap('n', '<leader>t', ':!pytest %<CR>', { noremap = true, silent = true })

-- Key mappings for vimrc file
vim.api.nvim_set_keymap('n', '<leader>v', ':e ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true })

-- Key mappings for move lines up and down
-- Move line up
vim.api.nvim_set_keymap('n', '<C-j>', ':m .+1<CR>==', { noremap = true, silent = true })
-- Move line down
vim.api.nvim_set_keymap('n', '<C-k>', ':m .-2<CR>==', { noremap = true, silent = true })
--Move line up in visual mode
vim.api.nvim_set_keymap('v', '<C-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
--Move line down in visual mode
vim.api.nvim_set_keymap('v', '<C-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Set Mapping Nerdtree Toggle Ctrl+t
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

--Set Mapping for Copilot Chat

-- Toggle Copilot Chat
vim.api.nvim_set_keymap('n', '<leader>cpc', ':lua require("CopilotChat").toggle()<CR>', { noremap = true, silent = true })

--Copilot Chat Ask
vim.api.nvim_set_keymap('n', '<leader>cpa', ':lua require("CopilotChat").ask()<CR>', { noremap = true, silent = true })

-- Copy to clipboard "+ register by Ctrl+c
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Key mappings for nvim-dap

-- Toggle breakpoint
vim.api.nvim_set_keymap('n', '<leader>bp', ':lua require"dap".toggle_breakpoint()<CR>', { noremap = true, silent = true })

-- Step into
vim.api.nvim_set_keymap('n', '<F7>', ':lua require"dap".step_into()<CR>', { noremap = true, silent = true })

-- Step over
vim.api.nvim_set_keymap('n', '<F8>', ':lua require"dap".step_over()<CR>', { noremap = true, silent = true })

-- Step out
vim.api.nvim_set_keymap('n', '<F9>', ':lua require"dap".step_out()<CR>', { noremap = true, silent = true })

-- Continue
vim.api.nvim_set_keymap('n', '<F5>', ':lua require"dap".continue()<CR>', { noremap = true, silent = true })

-- Evaluate expression
vim.api.nvim_set_keymap('n', '<leader>ee', ':lua require"dapui".eval()<CR>', { noremap = true, silent = true })

-- Vimwiki remap VimwikiTableNextCell in insert mode not to conflict with Copilot
vim.api.nvim_set_keymap('i', '<C-l>', '<Plug>VimwikiTableNextCell', { noremap = false, silent = true })

-- Git Fugitive maps
vim.api.nvim_set_keymap('n', '<leader>gs', ':G<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gc', ':G commit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gp', ':G push<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gl', ':G pull<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gb', ':G branch<CR>', { noremap = true, silent = true })
