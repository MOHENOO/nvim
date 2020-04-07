"vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"分屏移动按键映射
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"插入模式jj映射Esc
:imap jj <Esc>

"leader键修改
let mapleader = "\<Space>"
let maplocalleader=","
:map <SPACE> <leader>

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
nmap <leader>z :call Zoom()<CR>

"Anyjump
nnoremap <silent> <leader>j :AnyJump <CR>
xnoremap <silent> <leader>j :AnyJumpVisual <CR>
nnoremap <silent> <leader>ab :AnyJumpBack <CR>
nnoremap <silent> <leader>al :AnyJumpListResults <CR>

"coc-explorer
:nmap <leader>e :CocCommand explorer<CR>

"vim-clap
:nmap <leader>p :Clap files<CR>
:nmap <Leader>: :Clap command<CR>
:nmap <Leader>f :Clap grep<CR>

"tabbar
" nmap <leader>t :TagbarToggle<CR>
"vista
nmap <leader>t :Vista!!<CR>

"vimux
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>

"whichkey
nnoremap <leader> :<C-U>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

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

"coc-diagnostic
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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
nmap <LocalLeader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <LocalLeader>f  <Plug>(coc-format-selected)
nmap <LocalLeader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <LocalLeader>a  <Plug>(coc-codeaction-selected)
nmap <LocalLeader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <LocalLeader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <LocalLeader>qf  <Plug>(coc-fix-current)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <LocalLeader>d <Plug>(coc-range-select)
xmap <silent> <LocalLeader>d <Plug>(coc-range-select)

" CocList
" Show all diagnostics
nnoremap <silent> <LocalLeader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <LocalLeader>e  :<C-u>CocList marketplace<cr>
" Show commands
nnoremap <silent> <LocalLeader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <LocalLeader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <LocalLeader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <Localleader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <LocalLeader>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <LocalLeader>p  :<C-u>CocListResume<CR>
nnoremap <silent> <LocalLeader>g  :<C-u>CocList --normal gstatus<CR>
" grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <LocalLeader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>

" use <C-j> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<C-j>" :
      \ coc#refresh() " use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <C-l> pumvisible() ? "\<C-y>" : "\<C-g>u\<C-l>"
inoremap <silent><expr> <C-l> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<C-l>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" coc-snippets
" Use <Tab> for both expand and jump (make expand higher priority.)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-TAB>'
