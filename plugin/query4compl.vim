if exists('g:loaded_query4compl') && g:loaded_query4compl
    finish
endif
let g:loaded_query4compl= 1

let s:save_cpo= &cpo
set cpo&vim

let g:query4compl_config= {
\   'data_directory': expand('~/.query4compl/'),
\}

command! Query4ComplEdit call query4compl#edit()
command! Query4ComplNew call query4compl#create()

let &cpo= s:save_cpo
unlet s:save_cpo
