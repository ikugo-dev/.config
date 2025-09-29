-- lua file locations
local my_path = vim.fn.stdpath("config") .. "/lua"
package.path = package.path  .. ";" .. my_path .. "/?.lua"

-- custom keymaps
require("keymaps")

-- plugins
local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("nvim-mini/mini.nvim")
Plug("neovim/nvim-lspconfig")
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")
Plug("lukas-reineke/indent-blankline.nvim")
Plug('Shatur/neovim-ayu')

-- language specific plugins
Plug("posva/vim-vue") -- vue3
-- Plug("mfussenegger/nvim-jdtls") -- java
-- Plug("elixir-editors/vim-elixir") -- elixir
-- Mason plugins:
    -- ◍ clangd
    -- ◍ jdtls
    -- ◍ omnisharp
    -- ◍ shellcheck
    -- ◍ pyright
    -- ◍ elixir-ls elixirls
    -- ◍ bash-language-server bashls
    -- ◍ deno denols
    -- ◍ eslint-lsp eslint
    -- ◍ html-lsp html
    -- ◍ prettier
    -- ◍ gopls

vim.call("plug#end")

-- theme
require('ayu').setup({ -- transparency
    overrides = {
        Normal = { bg = "None" },
        NormalFloat = { bg = "none" },
        ColorColumn = { bg = "None" },
        SignColumn = { bg = "None" },
        Folded = { bg = "None" },
        FoldColumn = { bg = "None" },
        CursorLine = { bg = "None" },
        CursorColumn = { bg = "None" },
        VertSplit = { bg = "None" },
    },
})
vim.cmd("colorscheme ayu") -- actual theme
vim.cmd("set fillchars+=stl:\\─,stlnc:\\-") -- line in statusbar
require("indent_blanklines") -- lines for tabs
require("mini.diff").setup() -- git visuals
require("mini.icons").setup() -- icons
-- local snazzy_theme = vim.fn.stdpath("config") .. "/snazzy.vim"
-- vim.cmd("source " .. snazzy_theme)

-- better "*" command
local star_search = vim.fn.stdpath("config") .. "/star_search.vim"
vim.cmd("source " .. star_search)

-- scrolling limit 
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.colorcolumn = "100"

-- tab bullshit
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- clipboard bullshit
vim.opt.clipboard = "unnamedplus"

-- file explorer
require("mini.files").setup({
    mappings = {
    go_in       = "<S-Right>",
    go_in_plus  = "<Right>",
    go_out      = "<S-Left>",
    go_out_plus = "<Left>",
    },
})

-- automatic mason lsp config
require("mini.completion").setup()
require("mason").setup()
require("lsp_keymaps")
require("mason-lspconfig").setup({
  automatic_enable = true,
  settings = {
    python = {
      pythonPath = vim.fn.getcwd() .. "/../bin/python3"
    }
  },
})

-- text highlight
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
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

-- move lines around with Alt
require("mini.move").setup({
    mappings = {
        left = "<M-Left>",
        right = "<M-Right>",
        down = "<M-Down>",
        up = "<M-Up>",
        line_left = "<M-Left>",
        line_right = "<M-Right>",
        line_down = "<M-Down>",
        line_up = "<M-Up>",
    },
})

require("mini.splitjoin").setup() -- default = "gS"

require("language_specific_lsp")
