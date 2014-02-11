let s:save_cpo= &cpo
set cpo&vim

" choose query which will be executed {{{
let s:choose_query= {
\   'name': 'query4compl/choose_query',
\   'description': 'choose a one of query to run "query4compl/choose_result".',
\}

function! s:start_complete(candidate)
    call unite#start_complete(['query4compl/choose_result'], {'source__queryname': get(a:candidate, 'action__filename', '')})
endfunction

function! s:choose_query.gather_candidates(args, context)
    return [{
    \   'word': 'test',
    \   'kind': 'phenix',
    \   'action__delegate': function('s:start_complete'),
    \}]
endfunction
" }}}
"
" choose one of query result {{{
let s:choose_result= {
\   'name': 'query4compl/choose_result',
\   'description': 'choose a one of query result for completion. this has to run after a query has chosen.',
\}
" }}}

function! s:choose_result.gather_candidates(args, context)
    let l:queryname= a:context.source__queryname
    let l:filename= g:query4compl_config.data_directory . '/' . l:queryname

    try
        " TODO
        let l:connection= vdbc#connect({})
    finally
        if exists('l:connection')
            call l:connection.disconnect()
            unlet l:connection
        endif
    endtry
endfunction

function! unite#sources#query4compl#define()
    return deepcopy([s:choose_query, s:choose_result])
endfunction

let &cpo= s:save_cpo
unlet s:save_cpo
