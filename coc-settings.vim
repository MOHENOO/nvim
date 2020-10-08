" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" global workspace
set sessionoptions+=globals

" coc-config's json commont
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType jsonc setlocal commentstring=//\ %s

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd FileType json syntax match Comment +\/\/.\+$+

" root-dir
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'virtualenv']

"coc-go
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>

"coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

"coc-extensions
let g:coc_global_extensions = ["coc-yank","coc-yaml","coc-word","coc-translator","coc-python","coc-pyright","coc-tasks","coc-tag","coc-syntax","coc-snippets","coc-sh","coc-project","coc-pairs","coc-markdownlint","coc-json","coc-lists","coc-imselect","coc-highlight","coc-go","coc-gitignore","coc-git","coc-emoji","coc-docker","coc-dictionary","coc-calc","coc-marketplace","coc-rainbow-fart"]
