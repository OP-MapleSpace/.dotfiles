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
Plug 'bluz71/vim-moonfly-colors'
Plug 'ap/vim-css-color'
Plug 'https://github.com/p00f/nvim-ts-rainbow'

-- Start screen
Plug 'mhinz/vim-startify'

-- Linting + syntax
Plug 'w0rp/ale'
Plug 'https://github.com/vim-syntastic/syntastic/'

-- Autopairing, autocomplete, etc. 
Plug 'https://github.com/windwp/nvim-ts-autotag'
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'

-- Commenting
Plug 'https://github.com/tpope/vim-commentary'

-- On-demand loading
Plug ('tpope/vim-fireplace', { ['for'] = 'clojure' })

-- Treesitter for many different plugins
Plug ('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})  -- We recommend updating the parsers on update

-- Games :) (Tetris is so fun)
Plug 'https://github.com/alec-gibson/nvim-tetris'
Plug 'https://github.com/seandewar/nvimesweeper'
Plug 'johngrib/vim-game-snake'

-- LSP stuff
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'

-- Yuck (for EWW)
Plug 'https://github.com/elkowar/yuck.vim'

-- fzf
Plug 'gfanto/fzf-lsp.nvim'
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})

-- Lua functions I think
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'https://github.com/nvim-lua/plenary.nvim'

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

-- more lua stuff probably
Plug 'tjdevries/nlua.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'euclidianAce/BetterLua.vim'
Plug 'tjdevries/manillua.nvim'

-- Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

-- Battery
Plug 'https://github.com/lambdalisue/battery.vim/'

-- File system viewer
Plug ('ms-jpq/chadtree', {['do'] = 'python3 -m chadtree deps'})

-- Tags viewer
Plug 'https://github.com/preservim/tagbar'

-- File viewer but with symbol outlines
Plug 'https://github.com/simrat39/symbols-outline.nvim'

-- Discord Rich Presence (for the flex, of course)
Plug 'andweeb/presence.nvim'

-- language packs
Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/Quramy/tsuquyomi/'
Plug 'https://github.com/leafgarland/typescript-vim'

-- Typescript
Plug 'tpope/vim-fugitive'

-- Tmux config
Plug 'christoomey/vim-tmux-navigator'
Plug 'https://github.com/arl/gitmux'

-- Git plugins
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'rbong/vim-flog'
Plug 'https://github.com/airblade/vim-gitgutter'

-- Basically allows me to do sudo while keeping my configs
Plug 'https://github.com/lambdalisue/suda.vim'

-- ALE (Asynchronous Lint Engine)
vim.g['ale_fixers'] = {
	javascript = {'eslint'}
}
vim.g['ale_sign_error'] = '❌'
vim.g['ale_sign_warning'] = '⚠️'
vim.g['ale_fix_on_save'] = 1

-- Airline
vim.g['airline#extensions#tabline#enabled'] = 1

-- vim battery
vim.g['battery#update_tabline'] = 1    -- For tabline.
vim.g['battery#update_statusline'] = 1 -- For statusline.

vim.call('plug#end')
