function! latex#run()
    let latexfile = expand("%")
    let dvifile = expand("%:r").'dvi'
    call system("platex ".latexfile)
    call system("dvipdfmx ".dvifile)
    execute "OpenBrowser" expand("%:p:r"). '.pdf'
endfunction
