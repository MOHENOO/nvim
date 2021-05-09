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

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

"Terminus
let g:TerminusMouse = 1

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

"tmux-navigator
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1


"fzf
" set rtp+=$HOME/.fzf

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
Plug 'mhinz/vim-startify'
"" Theme
Plug 'itchyny/lightline.vim'
Plug 'josa42/vim-lightline-coc'
Plug 'niklaas/lightline-gitdiff'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
"" Other
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'yggdroot/indentline'
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-xtabline'
" Format
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'AndrewRadev/splitjoin.vim'
" Git
Plug 'tpope/vim-fugitive'
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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pechorin/any-jump.vim'
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
autocmd User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
Plug 'AckslD/nvim-whichkey-setup.lua'
" Terminal
Plug 'wincent/terminus'
" Vimwiki
" Task like vscode
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
" Initialize plugin system
call plug#end()
