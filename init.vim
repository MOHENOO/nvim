" Without vi mode
set nocompatible

"Auto check vim-plug,if not exist will download.
let plug = expand("~/.local/share/nvim/site/autoload/plug.vim")
if !filereadable(plug)
    echo "Installing vim-plug.."
    echo ""
    !command curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Plugs and Plugs's setting without coc
source $HOME/.config/nvim/plugins.vim
" All keymap
source $HOME/.config/nvim/mappings.vim
" NeoVim 's setting
source $HOME/.config/nvim/settings.vim
" Coc's setting
source $HOME/.config/nvim/coc-settings.vim
