# MOHENOO's Neovim Config

## Required

- Macos or Linux
- neovim >= 0.4.0 (floatwindow support)
- python3
    - pip3 install --user pynvim
- node and yarn
- NerdFont

## Required Tool

- rg (Ripgrep): [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)
- Universal ctags: [ctags.io](https://ctags.io/)
  - mac `brew install --HEAD universal-ctags/universal-ctags/universal-ctags`

## Installation

```shell
git clone --depth=1 https://github.com/mohenoo/neovim.git ~/.config/nvim
vim
:PlugInstall
```

- If you don't have [vim-plug](https://github.com/junegunn/vim-plug), It will auto download.

## Config's Tree

- init.vim
- setting.vim(vim's setting)
- plugins.vim(plug manage and plug's setting)
- mappings.vim(all keymap)
- coc-setting.vim(coc and coc's extension vim setting)
- coc-setting.json(coc's extension setting)
- vimspector(vimspector's setting)

## Plugs

### UI

- [mhinz/vim-startify](https://github.com/mhinz/vim-startify)
    - The fancy start screen for Vim.
- [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)
    - A light and configurable statusline/tabline plugin for Vim
- [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)
    - Adds file type icons to Vim plugins
- [liuchengxu/vista.vim](https://github.com/liuchengxu/vista.vim)
    - View and search LSP symbols, tags in Vim/NeoVim.
- [majutsushi/tagbar](https://github.com/majutsushi/tagbar)
    - Displays tags in a window, ordered by scope
- [yggdroot/indentline](https://github.com/Yggdroot/indentLine)
    - Display the indention levels with thin vertical lines
- [luochen1990/rainbow](https://github.com/luochen1990/rainbow)
    - Rainbow Parentheses Improved
- [mg979/vim-xtabline](https://github.com/mg979/vim-xtabline)
    - Tabline customization with buffer filtering

### Theme

- [joshdick/onedark.vim](https://github.com/joshdick/onedark.vim)
- [arcticicestudio/nord-vim](https://github.com/arcticicestudio/nord-vim)
- [liuchengxu/space-vim-theme](https://github.com/liuchengxu/space-vim-theme)
- [rakr/vim-one](https://github.com/rakr/vim-one)
- [drewtempelmeyer/palenight.vim](https://github.com/drewtempelmeyer/palenight.vim)
- [srcery-colors/srcery-vim](https://github.com/srcery-colors/srcery-vim)
- [mhartington/oceanic-next](https://github.com/mhartington/oceanic-next)
- [morhetz/gruvbox](https://github.com/morhetz/gruvbox)
- [dracula/vim](https://github.com/dracula/vim)

### Format

- [junegunn/vim-easy-align](https://github.com/junegunn/vim-easy-align)
    - A Vim alignment plugin
- [tpope/vim-surround](https://github.com/tpope/vim-surround)
    - Quoting/parenthesizing made simple
- [tpope/vim-commentary](https://github.com/tpope/vim-commentary)
    - Comment stuff out
- [AndrewRadev/splitjoin.vim](https://github.com/AndrewRadev/splitjoin.vim)
    - Switch between single-line and multiline forms of code

### Git

- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
    - A Git wrapper so awesome, it should be illegal
- [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)
    - A Vim plugin which shows a git diff in the sign column and stages/previews/undoes hunks and partial hunks.

### Debug

- [puremourning/vimspector](https://github.com/puremourning/vimspector)
    - A multi-language debugging system for Vim(https://github.com/)

### Search

- [easymotion/vim-easymotion](https://github.com/easymotion/vim-easymotion)
    - Vim motions on speed!
- [junegunn/fzf](https://github.com/junegunn/fzf)
    - A command-line fuzzy finder
- [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)
    - fzf ❤️ vim
- [pechorin/any-jump.vim](https://github.com/pechorin/any-jump.vim)
    - Jump to any definition and references
- [liuchengxu/vim-clap](https://github.com/liuchengxu/vim-clap)
    - Modern performant generic finder and dispatcher for Vim and NeoVim

## ......Wait complete......

