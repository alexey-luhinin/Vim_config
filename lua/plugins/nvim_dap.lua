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
