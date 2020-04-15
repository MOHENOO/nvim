" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

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
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd FileType json syntax match Comment +\/\/.\+$+


"coc-go
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>

"coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

"coc-extensions
let g:coc_global_extensions = ["coc-yank","coc-yaml","coc-word","coc-translator","coc-todolist","coc-template","coc-tasks","coc-tag","coc-syntax","coc-sql","coc-spell-checker","coc-snippets","coc-sh","coc-python","coc-project","coc-prettier","coc-pairs","coc-markdownlint","coc-json","coc-lists","coc-imselect","coc-highlight","coc-go","coc-gitignore","coc-git","coc-explorer","coc-emoji","coc-docker","coc-dictionary","coc-clock","coc-calc","coc-actions","coc-marketplace"]
