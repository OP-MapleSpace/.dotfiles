-- utf-8 encoding
vim.opt.encoding = "utf-8"

-- enable mouse
vim.opt.mouse = "a"

-- enable lists
vim.opt.list = true

-- set indent width
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.cmd("set expandtab")
vim.opt.autoindent = true
vim.opt.smartindent = true

-- set case handling
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- command line settings
vim.opt.cmdheight = 1

-- set some timeouts
vim.opt.updatetime = 300
vim.opt.tm = 500
vim.cmd("set shortmess+=c")

-- enable hidden bufferrs
vim.opt.hidden = true

-- split config
vim.opt.splitbelow = true
vim.opt.splitright = true

-- sign column config
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true

-- disable bells
vim.opt.errorbells = false
vim.opt.visualbell = false

-- use system clipboard
vim.cmd("set clipboard+=unnamedplus")

-- syntax highlighting
vim.opt.syntax = "on"
vim.opt.filetype = "on"
vim.opt.termguicolors = true

--Color Scheme--
vim.cmd [[silent! colorscheme ron]]

--Custom Commands--
function nnoremap(shortcut, command)
    vim.api.nvim_set_keymap("n", shortcut, command, { noremap = true, silent = true })
end
vim.g.mapleader = ','
nnoremap('<leader>s', 'set invspell<CR>')
-- - Map show undo tree
nnoremap('<leader>u', 'UndotreeShow<CR>')

--Plugin Manager--
-- Specify a directory for plugins
-- - For Neovim: stdpath('data') . '/plugged'
-- - Avoid using standard Vim directory names like 'plugin'
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

-- Icons + theme
Plug 'kyazdani42/nvim-web-devicons'
Plug 'https://github.com/yamatsum/nvim-nonicons'

-- Start screen
Plug 'mhinz/vim-startify'

-- Linting, syntax, autopairing, autocomplete, etc.
Plug 'dense-analysis/ale'
Plug 'https://github.com/windwp/nvim-ts-autotag'
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'

-- Commenting
Plug 'https://github.com/tpope/vim-commentary'

-- LSP stuff + Autocompletion
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'VonHeikemen/lsp-zero.nvim'

-- Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

-- Treesitter for many different plugins
Plug ('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- Games :) (Tetris is so fun)
Plug 'https://github.com/alec-gibson/nvim-tetris'
Plug 'https://github.com/seandewar/nvimesweeper'
Plug 'johngrib/vim-game-snake'

-- Yuck (for EWW)
Plug 'https://github.com/elkowar/yuck.vim'

-- Markdown
Plug 'https://github.com/preservim/vim-markdown/'

-- fzf
Plug 'gfanto/fzf-lsp.nvim'
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})

-- Lua stuff I think
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'euclidianAce/BetterLua.vim'
Plug 'tjdevries/manillua.nvim'

-- MATLAB
Plug 'https://github.com/yinflying/matlab.vim'

-- Search
Plug 'nvim-telescope/telescope.nvim'

-- Kitty terminal inside nvim :)
Plug 'https://github.com/jghauser/kitty-runner.nvim'

-- note taking stuff; Neorg for notes, Nabla for scientific stuff
Plug 'oberblastmeister/neuron.nvim'
Plug 'nvim-neorg/neorg'
Plug 'jbyuki/nabla.nvim'

-- for popups I think
Plug 'nvim-lua/popup.nvim'

-- Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

-- File system viewer
Plug ('ms-jpq/chadtree', {['do'] = 'python3 -m chadtree deps'})

-- Tags viewer
Plug 'https://github.com/preservim/tagbar'

-- Discord Rich Presence (for the flex, of course)
Plug 'andweeb/presence.nvim'

-- language packs
Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/Quramy/tsuquyomi/'
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/wuelnerdotexe/vim-astro'
Plug 'https://github.com/udalov/kotlin-vim'

-- Git plugins
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'rbong/vim-flog'
Plug 'https://github.com/airblade/vim-gitgutter'

-- End
vim.call('plug#end')

--Extra--

-- ALE (Asynchronous Lint Engine)
vim.g['ale_fixers'] = {
	javascript = {'eslint'}
}
vim.g['ale_sign_error'] = '❌'
vim.g['ale_sign_warning'] = '⚠️'
vim.g['ale_fix_on_save'] = 1

-- Airline
vim.g['airline#extensions#tabline#enabled'] = 1

-- Neorg
require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/notes",
                },
            },
        },
    },
}

-- Vim Astro
vim.g['astro_typescript'] = 'enable'

-- Set up nvim-cmp.
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

-- here you can setup the language servers
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'arduino-language-server', 'astro', 'clangd', 'cssls', 'cssmodules_ls', 'css_variables', 'eslint', 'gdscript', 'gdshader_lsp', 'gradle_ls', 'groovyls', 'java_language_server', 'kotlin_language_server', 'ltex', 'lua-ls', 'matlab_ls', 'nixd', 'pyright', 'qml_lsp', 'r_language_server', 'svelte', 'tailwindcss', 'tsserver'},
    handlers = {
        lsp_zero.default_setup,
    },
})
