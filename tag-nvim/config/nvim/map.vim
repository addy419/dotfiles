" Mappings
"
" NerdTree
map <silent> <C-n> :NERDTreeToggle<CR>
"
" Buffer Delete
"
nnoremap <Leader>q :Bdelete<CR>
nnoremap <Leader>q! :Bdelete!<CR>
"
" Format
"
nmap <silent> <M-F> :call CocAction('format')<CR>
imap <silent> <M-F> <C-O>:call CocAction('format')<CR>
"
" FZF
"
nmap <silent> <Leader><tab> <plug>(fzf-maps-n)
nmap <silent> <Leader><space> :Files<CR>
nmap <silent> <Leader>s :BLines<CR>
nmap <Leader>qr :QuickfixReplace
"
" Grammarous
"
nmap <silent> <Leader>gc :GrammarousCheck --no-preview<CR>
"
let g:grammarous#hooks = {}
"
function! g:grammarous#hooks.on_check(errs) abort
  nmap <buffer><Leader>gr <Plug>(grammarous-reset) 
  nmap <buffer><Leader>gf <Plug>(grammarous-fixit)
  nmap <buffer><Leader>gp <Plug>(grammarous-move-to-previous-error)
  nmap <buffer><Leader>gn <Plug>(grammarous-move-to-next-error)
endfunction
"
function! g:grammarous#hooks.on_reset(errs) abort
  nunmap <buffer><Leader>gr
  nunmap <buffer><Leader>gf
  nunmap <buffer><Leader>gp
  nunmap <buffer><Leader>gn
endfunction
"
" Jump to tab: <Leader>t
"
function TabName(n) " {{{
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return fnamemodify(bufname(buflist[winnr - 1]), ':t')
endfunction
" }}}
"
function! s:jumpToTab(line) " {{{
    let pair = split(a:line, ' ')
    let cmd = pair[0].'gt'
    execute 'normal' cmd
endfunction
" }}}
"
nnoremap <silent> <Leader>t :call fzf#run({
\   'source':  reverse(map(range(1, tabpagenr('$')), 'v:val." "." ".TabName(v:val)')),
\   'sink':    function('<sid>jumpToTab'),
\   'down':    tabpagenr('$') + 2
\ })<CR>
"
" QuickFix Replace
"
function! QuickfixReplace(bang, find, replace) " {{{
  if empty(a:bang)
    execute 'cdo s/' . a:find . '/' . a:replace . '/cg'
  else
    execute 'cdo s/' . a:find . '/' . a:replace . '/g'
  endif
endfunction
" }}}
"
command! -bang -nargs=* QuickfixReplace
      \ call QuickfixReplace(<q-bang>,<f-args>)
