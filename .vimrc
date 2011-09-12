syntax on
set list
set listchars=eol:¬
set hidden
set number

" default indentation: 4 spaces
set ts=4 sts=4 sw=4 expandtab

let hostname = substitute(system('hostname'), '\n', '', '')

if hostname !~ "labu"
    set t_Co=256
    colorscheme railscasts
end

if has("autocmd")
  filetype on
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType htmt setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd BufWritePre *.py,*.js,*.rb,*.c :call <SID>StripTrailingWhitespaces()
  autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml
endif

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
function! <SID>StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction


nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv
