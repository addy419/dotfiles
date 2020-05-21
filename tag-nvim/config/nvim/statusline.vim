" StatusLine
"
set noshowmode
"
"
set showtabline=2
"
"
let g:lightline = {
      \ 'colorscheme': 'ayu',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'coc_error', 'coc_warning', 'coc_hint', 'coc_info' ] ]
      \ },
      \  'inactive': {
      \    'left': [ [ 'pending' ] ],
      \    'right': [],
      \},
      \ 'tabline': {
      \   'left': [ [ 'buffers' ] ], 
      \   'right': [ [ 'gitbranch' ] ]
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'component_function': {
      \   'pending': 'LightlinePending',
      \   'mode': 'LightlineMode',
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \   'gitbranch': 'LightlineFugitive',
      \   'coc_error': 'LightlineCocErrors',
      \   'coc_warning': 'LightlineCocWarnings',
      \   'coc_info': 'LightlineCocInfos',
      \   'coc_hint': 'LightlineCocHints',
      \   'coc_fix': 'LightlineCocFixes',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel',
      \   'gitbranch': 'tabsel',
      \   'coc_error': 'error',
      \   'coc_warning': 'warning',
      \   'coc_info': 'tabsel',
      \   'coc_hint': 'middle',
      \   'coc_fix': 'middle',
      \ }
      \ }

let g:tcd_blacklist = '\v(help|nerdtree|netrw|quickmenu|fugitive)'

function! LightlineMode() abort " {{{
  return
        \ &filetype ==# 'fzf' ? 'FZF' :
        \ &filetype ==# 'fugitive' || 'gitcommit'  ? 'Fugitive' :
        \ &filetype ==# 'help' ? 'Help' :
        \ &filetype ==# 'nerdtree' ? 'NERDTree' :
        \ &filetype ==# 'netrw' ? 'Netrw' :
        \ &filetype ==# 'quickmenu' ? 'Menu' :
        \ &filetype ==# 'qf' ? 'Quickfix' :
        \ lightline#mode()
endfunction
" }}}

" @function(lighline#Pending)
" For inactive files, returns the full path and |&modified|.
function! LightlinePending() abort " {{{
  let l:filename = expand('%F') !=# '' ? expand('%F') : ''
  let l:filetype_symbol = exists('*WebDevIconsGetFileTypeSymbol') ? WebDevIconsGetFileTypeSymbol(l:filename) . ' ' : ''
  let l:modified = &readonly ? ' - ' : &modified ? ' + ' : ''
  return &filetype !~# g:tcd_blacklist ? (l:filetype_symbol . l:filename . l:modified) : LightlineMode()
endfunction
" }}}

function! LightlineFugitive() " {{{
    return &filetype !~# g:tcd_blacklist ? (' ' . FugitiveHead()) : ''
endfunction
" }}}

function! s:lightline_coc_diagnostic(kind, sign) abort " {{{
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || get(info, a:kind, 0) == 0
    return ''
  endif
  if a:kind == 'warning'
    let s = ""
  elseif a:kind == 'error'
    let s = ""
  elseif a:kind == 'information'
    let s = ""
  elseif a:kind == 'hints'
    let s = ""
  endif
  return printf('%s %d', s, info[a:kind])
endfunction
" }}}

function! LightlineCocErrors() abort " {{{
  return s:lightline_coc_diagnostic('error', 'error')
endfunction
" }}}

function! LightlineCocWarnings() abort " {{{
  return s:lightline_coc_diagnostic('warning', 'warning')
endfunction
" }}}

function! LightlineCocInfos() abort " {{{
  return s:lightline_coc_diagnostic('information', 'info')
endfunction
" }}}

function! LightlineCocHints() abort " {{{
  return s:lightline_coc_diagnostic('hints', 'hint')
endfunction
" }}}

autocmd User CocDiagnosticChange call lightline#update()

let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#number_separator = '. '
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#filename_modifier = ':t'
