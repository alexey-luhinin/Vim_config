require("CopilotChat").setup {
    debug = true,
    mappings = {
        complete = {
            insert = "<C-Space>",
        },
    },
}

-- Toggle Copilot Chat
vim.api.nvim_set_keymap('n', '<leader>cpc', ':lua require("CopilotChat").toggle()<CR>', { noremap = true, silent = true })
