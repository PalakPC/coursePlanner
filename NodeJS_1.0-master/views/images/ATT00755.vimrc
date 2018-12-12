set background=dark
set hlsearch
set autoindent
set cindent
set number
" Takes to the next line if more than 80 chars
"set tw=80
set wrap

if has('cscope')
       set cscopetag cscopeverbose

       if has('quickfix')
               set cscopequickfix=s-,c-,d-,i-,t-,e-
       endif

       cnoreabbrev csa cs add
       cnoreabbrev csf cs find
       cnoreabbrev csk cs kill
       cnoreabbrev csr cs reset
       cnoreabbrev css cs show
       cnoreabbrev csh cs help

       command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif
set splitright
set tabstop=4
set expandtab
set shiftwidth=4

" //very useful highlights anything more than 80 characters in red
"highlight OverLength ctermbg=darkred ctermfg=black guibg=#592929
"match OverLength /\%>80v.\+/

function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
     endif
endfunction
au BufEnter /* call LoadCscope()

