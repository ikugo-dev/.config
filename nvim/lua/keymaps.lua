local map = vim.keymap.set

-- fuck this
map('n', 'q:', '<Nop>', { noremap = true, silent = true })

-- -- move to window using the <ctrl> arrow keys
-- map("n", "<C-Up>", "<C-w>k", { desc = "Go to Left Window", remap = true })
-- map("n", "<C-Down>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
-- map("n", "<C-Left>", "<C-w>h", { desc = "Go to Upper Window", remap = true })
-- map("n", "<C-Right>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- resize window using <ctrl> hjkl keys
map("n", "<C-h>", "<cmd>resize +2<cr>", { desc = "Increase Window Height", remap = true })
map("n", "<C-j>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height", remap = true })
map("n", "<C-k>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width", remap = true })
map("n", "<C-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width", remap = true })

-- change buffers (tabs)
map("n", "<A-Left>", "<cmd>bprevious<cr>", { desc = "Prev Buffer", remap = true })
map("n", "<A-Right>", "<cmd>bnext<cr>", { desc = "Next Buffer", remap = true })

-- move Lines
map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move Down", remap = true })
map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move Up", remap = true })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down", remap = true })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up", remap = true })

-- append line below to the end of the current line
map("n", "<S-Up>", "J", { desc = "Append Up", remap = true })

-- view definition
map("n", "<S-Down>", "K", { desc = "View definition", remap = true })

-- change 2 tabs to 4
map( "n", "<leader>ci", [[:%s/^\(  \)\+/\=repeat(' ', len(submatch(0)) * 2)/g<CR>]], { noremap = true, silent = true, desc = "Increase tab size" })

-- file explorer
map( "n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
-- map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
-- vim.cmd("nnoremap gd :lua vim.lsp.buf.definition()<CR>")

-- -- disable the nitch ass jump after *
-- vim.keymap.set('n', '*', function()
--   vim.fn.setreg('/', '\\<' .. vim.fn.expand('<cword>') .. '\\>')
--   vim.cmd('set hlsearch')
-- end, { desc = "Highlight word under cursor without jumping" })
