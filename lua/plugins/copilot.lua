-- Enable Copilot
vim.api.nvim_set_keymap('n', '<leader>cpo', ':Copilot enable<CR>', { noremap = true, silent = false })

-- Disable Copilot
vim.api.nvim_set_keymap('n', '<leader>cpd', ':Copilot disable<CR>', { noremap = true, silent = false })
