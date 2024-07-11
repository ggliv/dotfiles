-- Buffer splitting
vim.keymap.set("n", "<leader>sv", "<C-w>s", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sb", "<C-w>v", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

vim.keymap.set("n", "<leader>sk", "<C-w><up>", { desc = "Focus above split" })
vim.keymap.set("n", "<leader>sj", "<C-w><down>", { desc = "Focus below split" })
vim.keymap.set("n", "<leader>sh", "<C-w><left>", { desc = "Focus left split" })
vim.keymap.set("n", "<leader>sl", "<C-w><right>", { desc = "Focus right split" })

-- Tab control
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Go to next tab" })

-- Some LSP keymaps are defined in plugins.lsp since I wasn't
-- able to figure out how to get the buffer number outside of
-- there.
