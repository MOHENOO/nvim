"nord
let g:nord_cursor_line_number_background = 1
" let g:nord_uniform_status_lines = 1
let g:nord_bold_vertical_split_line = 0
let g:nord_uniform_diff_background = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_bold = 1
augroup nord-theme-overrides
  autocmd!
  " Use 'nord7' as foreground color for Vim comment titles.
  autocmd ColorScheme nord highlight vimCommentTitle ctermfg=14 guifg=#8FBCBB
augroup END

"lightline
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

let g:lightline = {}
" let g:lightline.colorscheme = 'nord'
let g:lightline.colorscheme = 'onedark'
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {
    \   'gitdiff': 'lightline#gitdiff#get',
    \   'buffers': 'lightline#bufferline#buffers',
    \   'asyncrun_status': 'lightline#asyncrun#status'
    \ }
let g:lightline.component_type = {
    \   'gitdiff': 'middle',
    \   'buffers': 'tabsel'
    \ }
let g:lightline.component_function = {
    \   'currentfuction': 'CocCurrentFunction',
    \   'gitbranch': 'fugitive#head',
    \   'method': 'NearestMethodOrFunction',
    \ }
" Add the components to the lightline:
let g:lightline.active = {
    \   'left': [['mode','buffers', 'paste'],
    \            ['coc_errors', 'coc_warnings', 'coc_ok' ],
    \            ['coc_status'],
    \            ['currentfuction','method'],
    \            ['gitbranch','readonly','modified'],
    \            ['gitdiff']],
    \   'right': [['lineinfo'],['percent'],
    \             ['fileformat','fileencoding','filetype'],
    \             ['asyncrun_status']]
    \ }

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
" lightline-bufferline
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#enable_devicons = 1

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

"Terminus
let g:TerminusMouse = 0

"rainbow
let g:rainbow_active = 1

"any jumps
let g:any_jump_disable_default_keybindings = 1

"asyncrun
let g:asyncrun_open = 6

"vim-go
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_code_completion_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_referrers_mode = 'gopls'
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
let g:go_jump_to_error = 0
let g:go_auto_type_info = 1
let g:go_doc_max_height = 50
let g:go_doc_popup_window = 1
let g:go_term_enabled = 1
let g:go_term_close_on_exit = 1

" vim-go highlight
" let g:go_auto_sameids = 1
let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

"python-syntax
let g:python_highlight_all = 1
let g:python_version_2 = 1

"vim-compiler-python
let g:python_compiler_fixqflist = 1

" vimspector
let g:vimspector_enable_mappings = 'HUMAN'
" packadd! vimspector

"vista
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_sidebar_width = 40
let g:vista_echo_cursor_strategy = 'floating_win'
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

"tmux-navigator
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'
let g:vista_finder_alternative_executives = ['coc']

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
" let g:vista_executive_for = {}
let g:vista_executive_for = {
    \ 'vimwiki': 'markdown',
    \ 'markdown': 'toc',
    \ 'go': 'coc',
    \ 'python': 'ctags',
    \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
" let g:vista_ctags_cmd = {
"     \ 'haskell': 'hasktags -x -o - -c',
"     \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']
"
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
" let g:vista#renderer#icons = {
" \   "function": "\uf794",
" \   "variable": "\uf71b",
" \  }
"
"

"fzf
" set rtp+=$HOME/.fzf

"dashboard
let g:dashboard_default_executive ='clap'
" let g:dashboard_session_directory ='~/.cache/nvim/session'
let g:indentLine_fileTypeExclude = ['dashboard']

"vim-clap
let g:clap_theme = 'onedark'

"nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"asynctasks
function! s:run_tmux(opts)
    " asyncrun has temporarily changed dir for you
    " getcwd() in the runner function is the target directory defined in `-cwd=xxx`  
    let cwd = getcwd()   
    call VimuxRunCommand('cd ' . shellescape(cwd) . '; ' . a:opts.cmd)
endfunction

let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
let g:asyncrun_runner.tmux = function('s:run_tmux')
let g:asynctasks_term_pos = 'tmux'

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes
" UI
"" StartWindow
Plug 'hardcoreplayers/dashboard-nvim'
"" Theme
Plug 'itchyny/lightline.vim'
Plug 'josa42/vim-lightline-coc'
Plug 'niklaas/lightline-gitdiff'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'liuchengxu/space-vim-theme'
Plug 'rakr/vim-one'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
"" Other
Plug 'ryanoasis/vim-devicons'
Plug 'liuchengxu/vista.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'yggdroot/indentline'
Plug 'luochen1990/rainbow'
" Plug 'mg979/vim-xtabline'
" Format
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'AndrewRadev/splitjoin.vim'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" AutoComplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go'
Plug 'wellle/tmux-complete.vim'
" Highlight
Plug 'sheerun/vim-polyglot'
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'aliev/vim-compiler-python'
Plug 'kevinoid/vim-jsonc'
Plug 'kshenoy/vim-signature'
Plug 'pearofducks/ansible-vim'
" Debug
Plug 'puremourning/vimspector'
" Search
Plug 'easymotion/vim-easymotion'
" Plug 'junegunn/fzf' 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'pechorin/any-jump.vim'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'tmux-plugins/vim-tmux-focus-events'
" Zen
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" Multiple-cursors
Plug 'mg979/vim-visual-multi'
" Undotree
Plug 'mbbill/undotree'
" Whichkey
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
"database
" Plug 'tpope/vim-dadbod'
" Plug 'kristijanhusak/vim-dadbod-ui'
" Terminal
Plug 'wincent/terminus'
" Plug 'airblade/vim-rooter'
" Plug 'voldikss/vim-floaterm'
" Vimwiki
" Task like vscode
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
" Initialize plugin system
call plug#end()
