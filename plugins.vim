"lightline
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'component_function': {
    \   'cocstatus': 'coc#status',
    \   'currentfuction': 'CocCurrentFunction',
    \   'gitbranch': 'fugitive#head',
    \   'method': 'NearestMethodOrFunction',
    \ },
    \ 'active': {
    \   'left':  [[ 'mode', 'paste' ],
    \             [ 'gitbranch','cocstatus', 'currentfuction','readonly', 'filename', 'modified','method' ] ],
    \ },
    \ }

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

"Terminus
let g:TerminusMouse = 0

"Easymotion
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

"rainbow
let g:rainbow_active = 1

"any jumps
let g:any_jump_disable_default_keybindings = 1

"asyncrun
let g:asyncrun_open = 6

"vim-go
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_referrers_mode = 'gopls'
let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
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
    \ 'python': 'coc',
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
Plug 'airblade/vim-gitgutter'
" AutoComplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go'
Plug 'wellle/tmux-complete.vim'
" Debug
Plug 'puremourning/vimspector'
" Search
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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
" Terminal
Plug 'wincent/terminus'
Plug 'voldikss/vim-floaterm'
" Vimwiki
" Plug 'vimwiki/vimwiki'
" Task like vscode
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
" Initialize plugin system
call plug#end()
