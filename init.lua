-- install package manager if not exists
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end
-- load all plugins
require "pluginList"
require "options"
require "plugins.bufferline"

local g = vim.g

g.mapleader = " "
g.auto_save = true

-- colorscheme related stuff

g.nvchad_theme = "onedark"
vim.cmd 'colorscheme onedark'

require "highlights"
require "mappings"

require("utils").hideStuff()
