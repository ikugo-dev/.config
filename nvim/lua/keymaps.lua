local map = vim.keymap.set

map("n", "q:", "<Nop>", { silent = true }) -- fuck this
map("n", "<S-Up>", "J", { silent = true }) -- append line
map("n", "-", function() require("yazi").yazi() end)
map("n", "z", function() require("fzf-lua").files() end)

map("n", "gd",        vim.lsp.buf.definition,     { silent = true })
map("n", "<S-Down>",  vim.lsp.buf.hover,          { silent = true })
map("n", "<S-Right>", vim.diagnostic.open_float,  { silent = true })
map("n", "<Space>a",  vim.lsp.buf.code_action,    { silent = true })
map("n", "<Space>r",  vim.lsp.buf.rename,         { silent = true })
map("n", "<Space>f",  vim.lsp.buf.format,         { silent = true })


require("mini.move").setup({ -- move lines around with Alt
    mappings = {
        left       = "<C-Left>",  line_left = "<C-Left>",
        line_right = "<C-Right>", right     = "<C-Right>",
        line_down  = "<C-Down>",  down      = "<C-Down>",
        line_up    = "<C-Up>",    up        = "<C-Up>",
    },
})
