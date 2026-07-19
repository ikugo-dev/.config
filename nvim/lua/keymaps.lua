local map = vim.keymap.set

map("n", "q:", "<Nop>", { silent = true }) -- fuck this
map("n", "<S-Up>", "J", { silent = true }) -- append line
map("n", "-", function()
	require("yazi").yazi()
end)

map("n", "gd",        vim.lsp.buf.definition,     { silent = true })
map("n", "<S-Down>",  vim.lsp.buf.hover,          { silent = true })
map("n", "<Space>ca", vim.lsp.buf.code_action,    { silent = true })
map("n", "<Space>cr", vim.lsp.buf.rename,         { silent = true })
map("n", "<Space>cf", vim.lsp.buf.format,         { silent = true })
map("n", "<C-Down>",  vim.diagnostic.open_float,  { silent = true })

require("mini.move").setup({ -- move lines around with Alt
    mappings = {
        left       = "<M-Left>",  line_left = "<M-Left>",
        line_right = "<M-Right>", right     = "<M-Right>",
        line_down  = "<M-Down>",  down      = "<M-Down>",
        line_up    = "<M-Up>",    up        = "<M-Up>",
    },
})

local miniharp = require('miniharp')

map('n', '<Space>m', miniharp.toggle_file, { silent = true })
map('n', '<C-n>',    miniharp.next,        { silent = true })
map('n', '<C-p>',    miniharp.prev,        { silent = true })
map('n', '<Space>l', miniharp.show_list,   { silent = true })
map('n', '<Space>1', function() miniharp.go_to(1) end, { silent = true })
map('n', '<Space>2', function() miniharp.go_to(2) end, { silent = true })
map('n', '<Space>3', function() miniharp.go_to(3) end, { silent = true })
map('n', '<Space>4', function() miniharp.go_to(4) end, { silent = true })
map('n', '<Space>5', function() miniharp.go_to(5) end, { silent = true })
