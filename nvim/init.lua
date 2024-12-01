-- basic vim configuration
vim.cmd("set number")       -- enable line numbers
vim.cmd("set cursorline")   -- enale cursor line
vim.cmd("set nowrap")       -- disable screen text wrap 
vim.cmd("set expandtab")    -- convert tab to spaces
vim.cmd("set shiftwidth=4") -- set shift width
vim.cmd("set tabstop=4")    -- set tab width

-- lazy plugin manager
require "config.lazy"

-- colorscheme
require("catppuccin").setup()
vim.cmd("colorscheme catppuccin")

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

-- treesitter
local configs = require("nvim-treesitter.configs")
configs.setup({
    ensure_installed = { "lua", "bash", "c", "verilog", "vhdl" },
    highlight = { enable = true },
    indent = { enable = true },  
})

