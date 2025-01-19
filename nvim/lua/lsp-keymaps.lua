local map = vim.keymap.set

map('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
map('n', 'gD', vim.lsp.buf.declaration, { noremap = true, silent = true })
map('n', 'gr', vim.lsp.buf.references, { noremap = true, silent = true })
map('n', 'gi', vim.lsp.buf.implementation, { noremap = true, silent = true })
map('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })
map('n', '<Space>ca', vim.lsp.buf.code_action, { noremap = true, silent = true })
map('n', '<Space>cr', vim.lsp.buf.rename, { noremap = true, silent = true })
map('n', '<Space>cf', vim.lsp.buf.format, { noremap = true, silent = true })
-- map('n', '<Space>cen', vim.lsp.diagnostic.goto_next, { noremap = true, silent = true })
-- map('n', '<Space>ceN', vim.lsp.diagnostic.goto_prev, { noremap = true, silent = true })
-- map('n', '<Space>sh', vim.lsp.buf.signature_help, { noremap = true, silent = true })
-- map('n', '<Space>td', vim.lsp.buf.type_definition, { noremap = true, silent = true })
-- map('n', '<Space>ds', vim.lsp.buf.document_symbol, { noremap = true, silent = true })
-- map('n', '<Space>ws', vim.lsp.buf.workspace_symbol, { noremap = true, silent = true })
-- map('n', '<Space>e', vim.lsp.diagnostic.show_line_diagnostics, { noremap = true, silent = true })
-- map('n', '<Space>dl', vim.lsp.diagnostic.set_loclist, { noremap = true, silent = true })

local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),
    -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Esc>'] = cmp.mapping.abort(),
  },
  sources = {
    { name = 'nvim_lsp' }, -- LSP source
    { name = 'luasnip' },  -- Snippets source
    { name = 'buffer' },   -- Current buffer source
    { name = 'path' },     -- File path completions
  },
})

