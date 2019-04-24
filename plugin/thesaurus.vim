" File: thesaurus.vim
" Author: Quentin Guilloteau <Quentin.Guilloteau@grenoble-inp.org>
" Description: Thesaurus inside Vim !
" Last Modified: Today lol
"

function! s:GetWords(content)
    let l = []
    if type(a:content) == type([])
        return a:content
    else
        for key in keys(a:content)
            call add(l, '>>> '.key)
            for w in s:GetWords(get(a:content,key))
                call add(l, '       '.w)
            endfor
        endfor
        return l
    endif
endfunction

function! g:Thesaurus()
    let word = eval('expand("<cword>")')
    let api_key = 'f6b2d0a2af560f3c3494b350da31b3d8'
    let url = 'http://words.bighugelabs.com/api/2/'.api_key.'/'.word.'/json'
    let response = webapi#http#get(url)
    let content = webapi#json#decode(response.content)
    " should Test if response ok
    let l = s:GetWords(content)
    call insert(l, '# '.word)
    silent pedit results
    wincmd P
    setlocal buftype=nofile
    nnoremap <buffer> q :q!<cr>
    nnoremap <buffer> <Enter> 0wy$:q<Enter>viwp
    normal! ggdG
    call append(0, l)
    normal! ddgg
endfunction
