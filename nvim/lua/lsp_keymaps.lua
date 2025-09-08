local map = vim.keymap.set
map('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
map('n', 'gD', vim.lsp.buf.declaration, { noremap = true, silent = true })
map('n', 'gr', vim.lsp.buf.references, { noremap = true, silent = true })
map('n', 'gi', vim.lsp.buf.implementation, { noremap = true, silent = true })
map('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })
map('n', '<Space>ca', vim.lsp.buf.code_action, { noremap = true, silent = true })
map('n', '<Space>cr', vim.lsp.buf.rename, { noremap = true, silent = true })
map('n', '<Space>cf', vim.lsp.buf.format, { noremap = true, silent = true })

-- diagnostics
map('n', '<C-Down>', function()
  vim.diagnostic.open_float(nil, {
    focusable = true,
    source = "always",
    header = "",
    prefix = "",
  })
end, { desc = "Show diagnostics in floating window" })

-- Completion
require("mini.completion").setup({
  lsp_completion = {
    source_func = "omnifunc", -- use LSP omnifunc under the hood
    auto_setup = true,
  },
  mappings = {
    force_twostep = '<C-Space>', -- trigger completion
    confirm = '<CR>',           -- confirm selection
    close = '<Esc>',            -- close completion menu
  },
})

-- Snippets (instead of LuaSnip)
-- local snippets = require("mini.snippets")
--
-- snippets.setup({
--   snippets = {
--     -- You can define your own snippets here
--     my = {
--       snippets.gen_loader.from_file(vim.fn.stdpath("config") .. "/snippets/my_snippets.json"),
--     },
--   },
-- })
