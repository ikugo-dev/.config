-- lua file locations
local my_path = vim.fn.stdpath('config') .. '/lua'
package.path = package.path  .. ';' .. my_path .. '/?.lua'

-- custom keymaps
require('keymaps')

-- custom theme
local snazzy_theme = vim.fn.stdpath('config') .. '/snazzy.vim'
vim.cmd('source ' .. snazzy_theme)

-- scrolling limit 
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- tab bullshit
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- clipboard bullshit
vim.opt.clipboard = "unnamedplus"

-- plugins
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('stevearc/oil.nvim')
Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('L3MON4D3/LuaSnip')
Plug('lukas-reineke/indent-blankline.nvim')

vim.call('plug#end')

-- file explorer
require('oil').setup()

-- god damn lines
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}
local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)
require("ibl").setup({ indent = {
    highlight = highlight,
    char = "│",
} })

-- automatic mason lsp config
require('mason').setup()
local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup({
  automatic_installation = true,
})

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
    })
  end,
})
require('lsp-keymaps')

-- -- OLD: automatic mason lsp config - NO COMMAND COMPLETION
-- require('mason').setup()
-- local mason_lspconfig = require('mason-lspconfig')
-- mason_lspconfig.setup()
-- mason_lspconfig.setup_handlers({
--   function(server_name)
--     require('lspconfig')[server_name].setup{}
--   end,
-- })

-- text highlight
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 150,
    })
  end,
})

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
