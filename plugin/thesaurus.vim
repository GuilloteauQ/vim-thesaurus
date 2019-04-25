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
    if exists("g:ThesaurusAPIKey")
        let api_key = g:ThesaurusAPIKey
    else
        echoerr 'No API Key defined in vimrc ! -> let g:ThesaurusAPIKey = KEY'
        return
    endif
    let url = 'http://words.bighugelabs.com/api/2/'.api_key.'/'.word.'/json'
    let response = webapi#http#get(url)
    try
        let content = webapi#json#decode(response.content)
        let l = s:GetWords(content)
    catch
        let l = ['No result...']
    endtry
    call insert(l, '# '.word)
    silent pedit results
    wincmd P
    setlocal buftype=nofile
    nnoremap <buffer> q :q!<cr>
    nnoremap <buffer> <Enter> 0wy$:q<Enter>viwp
    normal! ggdG
    syntax keyword keywordsTherausus noun verb adjective sim ant syn rel
    hi link keywordsTherausus Keyword
    call append(0, l)
    normal! ddgg
endfunction

nnoremap <leader>t :call Thesaurus()<Enter>
