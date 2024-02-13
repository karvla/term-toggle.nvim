local M = {}

local editorBuffer
local terminalBuffer

local defaults = {
    toggle_terminal = '<C-t>',
}

function M.setup(conf)
    conf = conf or defaults
    conf.toggle_terminal = conf.toggle_terminal or defaults.toggle_terminal
    vim.keymap.set('t', conf.toggle_terminal, M.toggle_terminal ,{silent = true})
    vim.keymap.set('n', conf.toggle_terminal, M.toggle_terminal ,{silent = true})
end

local isInTerminal = function()
    local mode = vim.api.nvim_get_mode().mode
    return mode == 't' or mode == 'nt'
end


function M.toggle_terminal()
    if isInTerminal() then
        vim.api.nvim_set_current_buf(editorBuffer)
    else
        editorBuffer = vim.api.nvim_get_current_buf()
        if terminalBuffer == nil then
            vim.cmd('edit term://$SHELL')
            vim.cmd('setlocal nonumber')
        else
            vim.api.nvim_set_current_buf(terminalBuffer)
        end
        terminalBuffer = vim.api.nvim_get_current_buf()
        vim.cmd('startinsert')
    end
end

return M
