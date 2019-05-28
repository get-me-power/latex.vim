function! latex#run()
    if expand("%:e") != 'tex'
        echomsg 'texファイルを展開できません'
    else
        let latexfile = expand("%")
        call system("platex ".latexfile)
        call system("dvipdfmx ".expand('%:r'))
        if filereadable(expand("%:p:r").'.pdf')
            execute "OpenBrowser" expand("%:p:r"). '.pdf'
        else
            echoerr 'pdfファイルが存在しません'
            let error = system("cat ".expand("%:p:r").'.log')
            echo error
        endif
    endif
endfunction
