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
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :silent call CocAction('runCommand', 'editor.action.organizeImport')

" root-dir
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'virtualenv','go.mod']

"coc-go
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>

"coc-extensions
let g:coc_global_extensions = ["coc-yank","coc-yaml","coc-word","coc-python","coc-pyright","coc-tasks","coc-tag","coc-syntax","coc-snippets","coc-sh","coc-project","coc-pairs","coc-markdownlint","coc-json","coc-lists","coc-highlight","coc-go","coc-gitignore","coc-git","coc-emoji","coc-docker","coc-dictionary","coc-calc","coc-marketplace","coc-rainbow-fart","coc-rust-analyzer"]
