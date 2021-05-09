"插入模式jj映射Esc
:imap jj <Esc>

"leader键修改
let mapleader = "\<Space>"
let maplocalleader=","

"whichkey
let g:which_key_map = {}
let g:which_key_map['name'] = 'which_key root'
let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ 'o' :  ['only', 'close-all-windows-except-current'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ 'z' : ['Zoom()', 'zoom'],
      \ '?' : ['Windows', 'windows']
      \ }
let g:which_key_map['b'] = {
       \ 'name' : '+buffer' ,
       \ '1' : ['b1'        , 'buffer 1']        ,
       \ '2' : ['b2'        , 'buffer 2']        ,
       \ 'b' : ['Buffers'   , 'buffer']      ,
       \ 'd' : ['bd'        , 'delete-buffer']   ,
       \ 'f' : ['bfirst'    , 'first-buffer']    ,
       \ 'h' : ['Startify'  , 'home-buffer']     ,
       \ 'l' : ['blast'     , 'last-buffer']     ,
       \ 'n' : ['bnext'     , 'next-buffer']     ,
       \ 'p' : ['bprevious' , 'previous-buffer'] ,
       \ '?' : ['Buffers'   , 'buffer']      ,
       \ }
let g:which_key_map['s'] = {
    \ 'name' : '+search',
    \ 'a': ['Ag', 'ag'],
    \ 'b': ['Buffers', 'buffers'],
    \ 'c': ['Commands', 'command'],
    \ 'C': ['Colors', 'colors'],
    \ 'f': ['Files', 'files'],
    \ 'F': ['GFiles', 'project-files'],
    \ 'g': ['BCommits', 'git-commit'],
    \ 'G': ['Commits', 'project-commit'],
    \ 'h': ['History:', 'history'],
    \ 'm': ['Marks', 'marks'],
    \ 'M': ['Maps', 'maps'],
    \ 't': ['BTags', 'buffer-tags'],
    \ 'T': ['Tags', 'project-tags'],
    \ 'r': ['Rg', 'rg'],
    \ 'w': ['Windows', 'window'],
    \ 's': ['AnyJump', 'anyjump'],
    \ 'S': ['Snippets', 'snippets'],
    \ 'y': ['Yank()', 'yank']
  \ }
let g:which_key_map['t'] = {
    \ 'name': '+toggle',
    \ 'f': ['NERDTreeToggle', 'filetree'],
    \ 't': ['TagbarToggle', 'tagbar'],
    \ 'i' : ['IndentGuidesToggle'                 , 'indent-guide']           ,
    \ 'p' : ['setlocal paste!'                    , 'paste-mode']             ,
    \ 'g': ['GitGutterToggle()', 'git-gutter']
  \ }
" let g:which_key_map['l'] = {
"       \ 'name' : '+lsp',
"       \ 'f' : ['spacevim#lang#util#Format()'          , 'formatting']       ,
"       \ 'r' : ['spacevim#lang#util#FindReferences()'  , 'references']       ,
"       \ 'R' : ['spacevim#lang#util#Rename()'          , 'rename']           ,
"       \ 's' : ['spacevim#lang#util#DocumentSymbol()'  , 'document-symbol']  ,
"       \ 'S' : ['spacevim#lang#util#WorkspaceSymbol()' , 'workspace-symbol'] ,
"       \ 'g' : {
"         \ 'name': '+goto',
"         \ 'd' : ['spacevim#lang#util#Definition()'     , 'definition']      ,
"         \ 't' : ['spacevim#lang#util#TypeDefinition()' , 'type-definition'] ,
"         \ 'i' : ['spacevim#lang#util#Implementation()' , 'implementation']  ,
"         \ },
"       \ }
let g:which_key_map['e'] = {
    \ 'name': '+errors',
    \ 'n': ['<Plug>(coc-diagnostic-next)', 'next-error'],
    \ 'p': ['<Plug>(coc-diagnostic-prev)', 'prev-error'],
    \ 'e': ['Diagnostics()', 'list-error']
  \ }
let g:which_key_map['x'] = {
      \ 'name' : '+text'           ,
      \ 'a' : ['<Plug>(EasyAlign)' , 'easy-align']                 ,
      \ 's' : ['<Plug>(easymotion-s2)', 'easymotion-s2'],
      \ 't' : ['<Plug>(easymotion-t2)', 'easymotion-t2']
      \ }
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual ','<CR>

"分屏移动按键映射
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Zoom
function! Zoom ()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
       let l:cur_winview = winsaveview()
       let l:cur_bufname = bufname('')
       tabclose

       " restore the view
       if l:cur_bufname == bufname('')
          call winrestview(cur_winview)
       endif
    else
       tab split
    endif
endfunction

"Yank seach
function! Yank ()
    execute 'CocList -A --normal yank'
endfunction

" Coc Diagnostics
function! Diagnostics ()
    execute 'CocList diagnostics'
endfunction

" Coc GitGutterToggle
function! GitGutterToggle ()
    execute 'CocCommand git.toggleGutters'
endfunction

"coc-task
nnoremap <silent> <LocalLeader>a  :<C-u>CocList tasks<cr>

"vimux
" Prompt for a command to run
map <LocalLeader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <LocalLeader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <LocalLeader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
map <LocalLeader>vz :VimuxZoomRunner<CR>

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <Leader>r <Plug>(coc-rename)

" CocList
" Manage extensions
nnoremap <silent> <LocalLeader>m  :<C-u>CocList marketplace<cr>
" Show commands
nnoremap <silent> <LocalLeader>c  :<C-u>CocList commands<cr>
" Resume latest coc list
nnoremap <silent> <LocalLeader>g  :<C-u>CocList --normal gstatus<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<C-j>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-l> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<C-l>\<c-r>=coc#on_enter()\<C-l>"

" coc-snippets use tab and s-tab
inoremap <silent><expr> <TAB>
     \ pumvisible() ? coc#_select_confirm() :
     \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
     \ <SID>check_back_space() ? "\<TAB>" :
     \ coc#refresh()

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-TAB>'
