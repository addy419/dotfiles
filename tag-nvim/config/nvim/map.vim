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
