vim.g.vimwiki_list = {
    {
        path = '~/vimwiki/',
        syntax = 'markdown',
        ext = '.md',
    }
}

-- Vimwiki remap VimwikiTableNextCell in insert mode not to conflict with Copilot
vim.api.nvim_set_keymap('i', '<C-l>', '<Plug>VimwikiTableNextCell', { noremap = false, silent = true })
