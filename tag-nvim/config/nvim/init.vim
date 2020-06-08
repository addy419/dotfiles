" Leader
let mapleader = ";"

" Load plugins
source ~/.config/nvim/plugins.vim

" Coc.nvim
source ~/.config/nvim/coc.vim

" StatusLine
source ~/.config/nvim/statusline.vim

" Mouse Controls
set mouse=n

" True Colors
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax on
let ayucolor = 'dark'
colorscheme ayu

" Vim Session
set sessionoptions-=blank
set sessionoptions-=help
let g:workspace_create_new_tabs = 0
let g:workspace_session_disable_on_args = 1
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_persist_undo_history = 0
let g:workspace_autosave = 0

" Markdown Preview
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

" Bclose
let g:bclose_no_plugin_maps = 1

" Ranger
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1

" Fuzzy Finder
"
" Hide Status Line for FZF
autocmd!  FileType fzf set laststatus=0 noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler
" Hide Status Line for Lists
autocmd!  FileType list set laststatus=0 noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler
" Ignored Files
let s:fzf_ignore = '.git/*'
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!{' . s:fzf_ignore . '}"'
" Ripgrep
let s:ripgrep_ignore = '*.lock'
command! -bang -nargs=* Rg 
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --follow --glob "!{' . s:ripgrep_ignore . '}" --smart-case -e ' . shellescape(<q-args>, 1), 1, 
      \   fzf#vim#with_preview(), <bang>0
      \ )

" Basic
set number
set relativenumber
set nofixendofline
set tabstop=2
set shiftwidth=2
set expandtab

" Mappings
source ~/.config/nvim/map.vim
