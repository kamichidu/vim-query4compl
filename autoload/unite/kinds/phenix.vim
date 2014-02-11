let s:save_cpo= &cpo
set cpo&vim

let s:kind= {
\   'name': 'phenix',
\   'default_action': 'rebirth',
\   'action_table': {},
\}

" actions {{{
let s:rebirth= {
\   'is_start': 1,
\}
function! s:rebirth.func(candidates)
    let l:candidates= type(a:candidates) ==# type([]) ? a:candidates : [a:candidates]

    for l:candidate in l:candidates
        call l:candidate.action__delegate(l:candidate)
    endfor
endfunction

let s:kind.action_table.rebirth= s:rebirth
unlet s:rebirth
" }}}

function! unite#kinds#phenix#define()
    return deepcopy(s:kind)
endfunction

let &cpo= s:save_cpo
unlet s:save_cpo
