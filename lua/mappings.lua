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
