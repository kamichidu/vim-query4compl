let s:save_cpo= &cpo
set cpo&vim

let s:V= vital#of('query4compl')
let s:BM= s:V.import('Vim.BufferManager')
unlet s:V

let s:buf_for_edit= s:BM.new()

function! query4compl#create()
    let l:filename= input('query name: ')

    if empty(l:filename)
        return
    endif

    execute 'tabnew' l:filename

    setlocal nobuflisted bufhidden filetype=sql
endfunction

function! query4compl#edit()
endfunction

let &cpo= s:save_cpo
unlet s:save_cpo
