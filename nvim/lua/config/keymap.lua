-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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
