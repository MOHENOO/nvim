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
nnoremap <silent> <leader>jj :AnyJump <CR>
xnoremap <silent> <leader>jj :AnyJumpVisual <CR>
nnoremap <silent> <leader>jb :AnyJumpBack <CR>
nnoremap <silent> <leader>jl :AnyJumpListResults <CR>

"coc-explorer
nmap <leader>e :CocCommand explorer<CR>

"coc-yank
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>

"coc-translator
"" popup
nmap <LocalLeader>tp <Plug>(coc-translator-p)
vmap <LocalLeader>tp <Plug>(coc-translator-pv)
"" echo
nmap <LocalLeader>te <Plug>(coc-translator-e)

"vim-clap
nmap <leader>cf :Clap files ++finder=rg --ignore --hidden --files<CR>
nmap <Leader>cc :Clap colors<CR>
nmap <Leader>cg :Clap grep2<CR>
nmap <Leader>cm :Clap marks<CR>
nmap <Leader>cb :Clap buffers<CR>
nmap <Leader>ch :Clap history<CR>
nmap <Leader>ct :Clap tags<CR>
nmap <Leader>cj :Clap jumps<CR>
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>

"dashboard
let g:dashboard_custom_shortcut={
  \ 'last_session'       : 'SPC s l',
  \ 'find_history'       : 'SPC c h',
  \ 'find_file'          : 'SPC c f',
  \ 'change_colorscheme' : 'SPC c c',
  \ 'find_word'          : 'SPC c g',
  \ 'book_marks'         : 'SPC c m',
  \ 'new_file'           : 'SPC c n',
  \ }

"tabbar
" nmap <leader>t :TagbarToggle<CR>
"vista
nmap <leader>t :Vista!!<CR>

"vimux
" Prompt for a command to run
map <LocalLeader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <LocalLeader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <LocalLeader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
map <LocalLeader>vz :VimuxZoomRunner<CR>

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
nmap <Leader>r <Plug>(coc-rename)

" Remap for format selected region
xmap <Leader>f  <Plug>(coc-format-selected)
nmap <Leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <LocalLeader>a  <Plug>(coc-codeaction-selected)
" nmap <LocalLeader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
" nmap <LocalLeader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <Leader>q  <Plug>(coc-fix-current)

"coc-action
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <Leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <Leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@<CR>

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver
" nmap <silent> <LocalLeader>d <Plug>(coc-range-select)
" xmap <silent> <LocalLeader>d <Plug>(coc-range-select)

" CocList
" Show all diagnostics
nnoremap <silent> <Leader>d  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <LocalLeader>m  :<C-u>CocList marketplace<cr>
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
" inoremap <silent><expr> <TAB>
"      \ pumvisible() ? coc#_select_confirm() :
"      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()

" let g:coc_snippet_next = '<tab>'
" let g:coc_snippet_prev = '<S-TAB>'
