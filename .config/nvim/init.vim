" settings

" automatically source any .vimrc present in directory where vim was ran
set exrc

" block cursor (instead of a thin line)
set guicursor=

" line numbers and relative line numbers
set nu rnu

" no highlighting when searching
set nohlsearch

" no error beeps and sounds
set noerrorbells

" change tab width
set tabstop=2 softtabstop=2

" number of spaces used for each step of autoindent
set shiftwidth=2

" convert tabs to spaces
set expandtab

" autoindent when starting a new line (useful for programming)
set smartindent

" turn off text wrap
set nowrap

" do not use a swapfile
set noswapfile

" do not create a backup of the file before overwriting it
set nobackup

" automatically save undo history to an undo file
set undofile

" show pattern match as it is being typed
set incsearch

" enable 24bit rgb color in the tui
set termguicolors

" minimum number of lines to keep above and below the cursor when scrolling
set scrolloff=10

" remove mode text from the very bottom as lightline plugin is clear already
set noshowmode

" compleition options
set completeopt=menuone,noinsert,noselect

" do not pass messages to ins-completion-menu
set shortmess+=c

" always show the sign column (first column to the left)
set signcolumn=yes

" give more space for displaying messages at the bottom
set cmdheight=2

" having long update time (default is 4000ms or 4 seconds) leads to noticeable
" delays and a poor user experience
set updatetime=50

" vertical bar for line length
set colorcolumn=80

" make "+y copy to system clipboard
set clipboard=unnamedplus

" plugin manager
call plug#begin('~/.config/nvim/plugins')

Plug 'itchyny/lightline.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'morhetz/gruvbox'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-system-copy'
Plug 'mattn/emmet-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

call plug#end()

" set color scheme
autocmd vimenter * ++nested colorscheme gruvbox

" custom maps
let mapleader = " "
imap jj <Esc>

" delete visually selected text and paste contents of register
vnoremap <leader>p "_dP

" reload config
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" move next in quickfix list
nnoremap <C-j> :cnext<CR>

" move back in quickfix list
nnoremap <C-k> :cprev<CR>

" visual mode - mode highlighted code up
vnoremap J :m '>+1<CR>gv=gv

" visual mode - mode highlighted code down
vnoremap K :m '<-2<CR>gv=gv

nnoremap <C-g>f :G diff --name-status develop<CR>

" telescope

" find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
}
EOF

" lsp config and nvim_cmp for completion
lua require("completion")
