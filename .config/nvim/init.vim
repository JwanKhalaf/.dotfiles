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
call plug#begin('~/.vim/plugged')

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
Plug 'OmniSharp/omnisharp-vim'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'kyazdani42/nvim-tree.lua'

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

" options for nvim-tree
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 0 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'notify',
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

lua require("nvim_tree")

lua require("lsp_config")

lua require("completion")
