" Leader
let mapleader = ";"

" Load plugins
source ~/.config/nvim/plugins.vim

" Mouse Controls
set mouse=n

" True Colors
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax on
colorscheme nord

" StatusLine
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'nord',
      \}

" Basic
set number
set relativenumber
set nofixendofline
set tabstop=2
set shiftwidth=2
set expandtab

" Ranger
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1
map <silent> <C-n> :RangerWorkingDirectory<CR>

" Buffer Delete
let g:bclose_no_plugin_maps = 1
nnoremap <Leader>q :Bclose<CR>
nnoremap <Leader>q! :Bclose!<CR>
