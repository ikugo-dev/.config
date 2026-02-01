-- lua file locations
local my_path = vim.fn.stdpath("config") .. "/lua"
package.path = package.path  .. ";" .. my_path .. "/?.lua"

-- custom keymaps
require("keymaps")

-- plugins
local Plug = vim.fn["plug#"]

vim.call("plug#begin")
    -- lsp
    Plug("nvim-mini/mini.nvim")
    Plug("neovim/nvim-lspconfig")
    Plug("williamboman/mason.nvim")
    Plug("williamboman/mason-lspconfig.nvim")
    -- file explorer
    Plug("mikavilpas/yazi.nvim")
    Plug("nvim-lua/plenary.nvim")
    -- theme
    Plug("Shatur/neovim-ayu")
    Plug("lukas-reineke/indent-blankline.nvim")
    -- language specific plugins
    -- Plug("elixir-editors/vim-elixir") -- elixir
    -- Mason plugins:
        -- ◍ bash-language-server bashls
        -- ◍ deno denols
        -- ◍ gopls
        -- ◍ html-lsp html
        -- ◍ jdtls
        -- ◍ pyright
        -- ◍ typescript-language-server ts_ls
        -- ◍ vtsls
        -- ◍ vue-language-server vue_ls
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
vim.keymap.set("n", "-", function()
  require("yazi").yazi()
end)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.api.nvim_create_autocmd({"VimEnter"}, {
  callback = function(data)
    if vim.fn.isdirectory(data.file) == 1 then
      require("yazi").yazi()
    end
  end
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
  automatic_installation = true,
})

-- vue lsp manual fixes because its lowk broken
local vue_language_server_path = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
local vue_plugin = {
    name = "@vue/typescript-plugin",
    location = vue_language_server_path,
    languages = { "vue" },
    configNamespace = "typescript",
}
vim.lsp.config("vtsls",{ 
    settings = { vtsls = { tsserver = { globalPlugins = { vue_plugin, }}}},
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})
vim.lsp.enable("vue_ls")
vim.lsp.enable("vtsls")

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
