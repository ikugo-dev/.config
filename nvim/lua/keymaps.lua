local map = vim.keymap.set

-- fuck this
map('n', 'q:', '<Nop>', { noremap = true, silent = true })

-- change buffers (tabs)
map("n", "<A-Left>", "<cmd>bprevious<cr>", { desc = "Prev Buffer", remap = true })
map("n", "<A-Right>", "<cmd>bnext<cr>", { desc = "Next Buffer", remap = true })

-- append line below to the end of the current line
map("n", "<S-Up>", "J", { desc = "Append Up", remap = true })

-- view definition
map("n", "<S-Down>", "K", { desc = "View definition", remap = true })

-- change 2 tabs to 4
map( "n", "<leader>ci", [[:%s/^\(  \)\+/\=repeat(' ', len(submatch(0)) * 2)/g<CR>]], { noremap = true, silent = true, desc = "Increase tab size" })

-- file explorer
map("n", "-", function()
      local buf_name = vim.api.nvim_buf_get_name(0)
      local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
      MiniFiles.open(path)
      MiniFiles.reveal_cwd()
    end, { desc = "Open Mini Files" }
)

-- map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
-- map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
-- vim.cmd("nnoremap gd :lua vim.lsp.buf.definition()<CR>")
--

-- -- move to window using the <ctrl> arrow keys
-- map("n", "<C-Up>", "<C-w>k", { desc = "Go to Left Window", remap = true })
-- map("n", "<C-Down>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
-- map("n", "<C-Left>", "<C-w>h", { desc = "Go to Upper Window", remap = true })
-- map("n", "<C-Right>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- resize window using <ctrl> hjkl keys
-- map("n", "<C-h>", "<cmd>resize +2<cr>", { desc = "Increase Window Height", remap = true })
-- map("n", "<C-j>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height", remap = true })
-- map("n", "<C-k>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width", remap = true })
-- map("n", "<C-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width", remap = true })
