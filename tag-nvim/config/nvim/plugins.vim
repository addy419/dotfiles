" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Coc IntelliSense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'

" NerdTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Devicons
Plug 'ryanoasis/vim-devicons'

" Lightline Status Bar
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" Ayu Theme
Plug 'ayu-theme/ayu-vim'

" Git Gutter
Plug 'airblade/vim-gitgutter'

" Git
Plug 'tpope/vim-fugitive'

" Buffer Delete
Plug 'moll/vim-bbye'

" Vim Session
Plug 'thaerkh/vim-workspace'

" Vim Polyglot
Plug 'sheerun/vim-polyglot'

" Markdown Preview
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
