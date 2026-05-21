local map = vim.keymap.set

map("n", "q:", "<Nop>", { silent = true }) -- fuck this
map("n", "<S-Up>", "J", { silent = true }) -- append line
map("n", "-", function()
	require("yazi").yazi()
end)

map("n", "gd", vim.lsp.buf.definition, { silent = true })
map("n", "gD", vim.lsp.buf.declaration, { silent = true })
map("n", "gr", vim.lsp.buf.references, { silent = true })
map("n", "gi", vim.lsp.buf.implementation, { silent = true })
map("n", "<S-Down>", vim.lsp.buf.hover, { silent = true })
map("n", "<Space>ca", vim.lsp.buf.code_action, { silent = true })
map("n", "<Space>cr", vim.lsp.buf.rename, { silent = true })
map("n", "<Space>cf", vim.lsp.buf.format, { silent = true })
map("n", "<C-Down>", vim.diagnostic.open_float, { silent = true })

require("mini.move").setup({ -- move lines around with Alt
    mappings = {
        left       = "<M-Left>",  line_left = "<M-Left>",
        line_right = "<M-Right>", right     = "<M-Right>",
        line_down  = "<M-Down>",  down      = "<M-Down>",
        line_up    = "<M-Up>",    up        = "<M-Up>",
    },
})
