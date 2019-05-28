function! latex#run()
    if expand("%:e") != 'tex'
        echomsg 'texファイルを展開できません'
    else
        let latexfile = expand("%")
        let dvifile = expand("%:r").'dvi'
        call system("platex ".latexfile)
        call system("dvipdfmx ".dvifile)
        if filereadable(expand("%:p:r").'.pdf')
            execute "OpenBrowser" expand("%:p:r"). '.pdf'
        else
            echomsg 'pdfファイルが存在しません'
        endif
    endif
endfunction
