-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

-- neo-tree
vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left toggle<CR>')

-- lspconfig
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { })
vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, { })
vim.keymap.set('n', '<leader>fo', vim.lsp.buf.format, { })

-- buffer
vim.keymap.set('n', '<TAB>', ':bn<CR>')
vim.keymap.set('n', '<S-TAB>', ':bp<CR>')

-- windows
vim.keymap.set('n', '<C-S-Up>', ':wincmd k<CR>')
vim.keymap.set('n', '<C-S-Down>', ':wincmd j<CR>')
vim.keymap.set('n', '<C-S-Left>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-S-Right>', ':wincmd l<CR>')

-- search 
vim.keymap.set('n', '<leader>cs', ':noh<CR>')

-- split maximize
vim.keymap.set('n', '<leader>m', ':Maximize<CR>')

-- substitute
vim.keymap.set("n", "s", require('substitute').operator, { noremap = true })
vim.keymap.set("n", "ss", require('substitute').line, { noremap = true })
vim.keymap.set("n", "S", require('substitute').eol, { noremap = true })
vim.keymap.set("x", "s", require('substitute').visual, { noremap = true })

-- trouble
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", {desc = "Diagnostics (Trouble)"})
