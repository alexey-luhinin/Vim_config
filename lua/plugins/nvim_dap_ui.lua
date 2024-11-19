local dap = require 'dap'

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


dap.listeners.after.event_initialized['dapui_config'] = function()
    require('dapui').open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
    require('dapui').close()
end
