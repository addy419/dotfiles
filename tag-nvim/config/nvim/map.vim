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
nmap <silent> <leader><tab> <plug>(fzf-maps-n)
nmap <silent> <leader><space> :Files<CR>
nmap <silent> <leader>s :BLines<CR>
nmap <leader>qr :QuickfixReplace
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
