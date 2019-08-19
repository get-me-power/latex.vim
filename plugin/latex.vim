if exists('g:loaded_latex')
  finish
endif
let g:loaded_latex = 1

let s:save_cpo = &cpo
set cpo&vim
set autochdir
command! -nargs=0 LatexRun call latex#run()

let &cpo = s:save_cpo
unlet s:save_cpo
