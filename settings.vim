"##################### UI #####################
"主题
colorscheme onedark
"背景
set background=dark
"彩色(Neovim 0.4.3)
set termguicolors
" tabline
set showtabline=2
"显示标尺
" set cursorline
"刷新间隔时间
set updatetime=300
"Timeout
set timeoutlen=500
"不显示模式
set noshowmode
"类似zsh提供的自动补全菜单
set wildmenu
set wildmode=full
"显示行号
set number
"相对行号
set relativenumber
"显示括号配对情况
set showmatch
"自动完成文件名
set lazyredraw
"光标在窗口位置
set scrolloff=5
"语法高亮
syntax enable
" 总是显示状态栏(Powerline需要2行)
set laststatus=2
"中文帮助
set helplang=cn

"##################### Search #####################
"""Search
" 设置搜索高亮
set hlsearch
"输入时搜索
set incsearch
"搜索时忽略大小写
set ignorecase
"搜索内容包含部分大写字符时,要使搜索大小写敏感
set smartcase

"##################### Folding #####################
"""Folding
"启用折叠
set foldenable
"起始折叠等级
set foldlevelstart=3
"最大折叠等级
set foldnestmax=10
"折叠模式
set foldmethod=indent

"##################### Indent #####################
"""Indent
filetype plugin indent on
"使用与上一行同样的缩进:
set autoindent
"创建新行时使用智能缩进
set smartindent

" ##################### Syntax #####################
"""Syntax
" 检测文件类型插件
filetype plugin on
filetype indent on
set fileformats=unix
"不换行
set nowrap
"移位操作长度
set shiftwidth=4
"只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。也就是说，不会在单词内部折行。
set linebreak
"拼写检查
set spell spelllang=en_us,cjk
"切换编辑文件,自动切换目录
" set autochdir
"增强撤销
set undofile
"打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示。
set autoread
"Smart tab
set smarttab
"设置tab宽度
set tabstop=4
"backspace删除tab
set softtabstop=4
"编辑的时候将所有的tab设置为空格
set expandtab
"文件编码
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,GB2312,big5
"自动保存
set autowrite
"左右分屏时,新建分屏在右方
set splitright
"上下分屏时,新建分屏在下方
set splitbelow

" ##################### Clipboard #####################
set clipboard=unnamed
