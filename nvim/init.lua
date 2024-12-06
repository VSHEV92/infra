--------------------------------------------------------------------------------------------------
-- basic vim configuration
vim.cmd("set number")       -- enable line numbers
vim.cmd("set cursorline")   -- enale cursor line
vim.cmd("set nowrap")       -- disable screen text wrap 
vim.cmd("set expandtab")    -- convert tab to spaces
vim.cmd("set shiftwidth=4") -- set shift width
vim.cmd("set tabstop=4")    -- set tab width

--------------------------------------------------------------------------------------------------
-- lazy plugin manager
require "config.lazy"

--------------------------------------------------------------------------------------------------
-- colorscheme
require("catppuccin").setup()
vim.cmd("colorscheme catppuccin")

--------------------------------------------------------------------------------------------------
-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

--------------------------------------------------------------------------------------------------
-- treesitter
local configs = require("nvim-treesitter.configs")
configs.setup({
    ensure_installed = { "lua", "bash", "c", "verilog", "vhdl" },
    highlight = { enable = true },
    indent = { enable = true },
})

--------------------------------------------------------------------------------------------------
-- neo-tree
vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left toggle<CR>')

--------------------------------------------------------------------------------------------------
-- lualine
require('lualine').setup({
    options = { theme  = 'dracula' },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    }
})

--------------------------------------------------------------------------------------------------
-- lspconfig
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "verible" },
})

local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup ({})
lspconfig.verible.setup ({})

vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { })
vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, { })
vim.keymap.set('n', '<leader>fo', vim.lsp.buf.format, { })

--------------------------------------------------------------------------------------------------
-- completions
require("luasnip.loaders.from_vscode").load()

local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
        require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources(
        {
            { name = 'luasnip' },
        },
        {
            { name = 'buffer' },
        }
    )
})
