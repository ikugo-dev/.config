-- plugins
vim.pack.add({
    "https://github.com/mikavilpas/yazi.nvim", -- file explorer
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/Shatur/neovim-ayu", -- theme
    "https://github.com/lukas-reineke/indent-blankline.nvim",
    "https://github.com/nvim-mini/mini.nvim", -- lsp
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/vieitesss/miniharp.nvim",
    -- Mason plugins:
    -- ◍ bash-language-server bashls
    -- ◍ gopls
    -- ◍ shellcheck
})

-- theme
require("ayu").setup({ -- transparency
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

-- automatic lsp config
require("mason").setup()
require("mason-lspconfig").setup()
require("mini.completion").setup({
	lsp_completion = {
		source_func = "omnifunc",
	},
})
vim.api.nvim_create_autocmd("BufWritePre", { -- format on save
    callback = function()
        vim.lsp.buf.format()
    end,
})

-- better "*" command
vim.cmd("source ~/.config/nvim/star_search.vim")

vim.opt.scrolloff = 8 -- scrolling limit
vim.opt.sidescrolloff = 8
vim.opt.relativenumber = true -- line numbers
vim.opt.number = true
vim.opt.colorcolumn = "100"
vim.opt.wrap = true -- soft wrap
vim.opt.linebreak = true
vim.opt.expandtab = true -- tab bullshit
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.clipboard = "unnamedplus" -- clipboard bullshit

-- open file explorer on directory open
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function(data)
		if vim.fn.isdirectory(data.file) == 1 then
			require("yazi").yazi()
		end
	end
})

-- custom keymaps
require("keymaps")

-- text highlight
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 150,
        })
    end,
})
