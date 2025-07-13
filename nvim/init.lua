-- lua file locations
local my_path = vim.fn.stdpath("config") .. "/lua"
package.path = package.path  .. ";" .. my_path .. "/?.lua"

-- custom keymaps
require("keymaps")

-- plugins
local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("nvimdev/oceanic-material")
Plug("stevearc/oil.nvim")
Plug("neovim/nvim-lspconfig")
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("L3MON4D3/LuaSnip")
Plug("lukas-reineke/indent-blankline.nvim")
-- language specific plugins
-- Plug("mfussenegger/nvim-jdtls") -- java
-- Plug("elixir-editors/vim-elixir") -- elixir

vim.call("plug#end")

-- theme
-- local snazzy_theme = vim.fn.stdpath("config") .. "/snazzy.vim"
-- vim.cmd("source " .. snazzy_theme)
vim.g.oceanic_material_transparent_background = 1
vim.cmd("colorscheme oceanic_material")

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
require("oil").setup()

-- new automatic mason lsp config
require("mason").setup()
require("lsp-keymaps")
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

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- java
-- local config = {
--   cmd = { "/home/alex/.local/share/nvim/mason/bin/jdtls" },
--   root_dir = require("jdtls.setup").find_root({ "gradlew", ".git", "mvnw" }),
-- }
-- require("jdtls").start_or_attach(config)

-- php
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = "*.blade.php",
--   callback = function()
--     vim.bo.filetype = "php"
--   end,
-- })
