# nvim-dotefiles
This repository contains the files that NVIM needs to use and customize NVIM.

### NVIM Version
* nvim 0.10.0

### Upgrade your system

```bash
sudo apt update && sudo apt upgrade -y
```

## How to install

#### Step 3: Create the Neovim configuration directory
Create the Neovim configuration directory if it doesn't exist:

``` bash
mkdir -p ~/.config/nvim
```

#### Step 4: Create the init.vim file
Create the init.vim file in the Neovim configuration directory:
``` bash
nvim ~/.config/nvim/init.vim
```
* NOTE: Copy only that

```bash
set noswapfile
syntax on
set mouse=a
set noerrorbells
set sw=2 sts=2
set termguicolors
set number
set smartindent
set rnu
set numberwidth=1
set nowrap
set nobackup
set showmatch
set incsearch
set ignorecase
set clipboard=unnamedplus
set encoding=UTF-8
set cursorline
set relativenumber
set showcmd
set ruler
set laststatus=2
set noshowmode
set smartcase
set hlsearch
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
filetype plugin indent on
set colorcolumn=80
"when we do a split, it will arrange below or above
set splitbelow
set splitright
"To paste programming language code
set foldmethod=syntax
"set foldmethod=indent
set nofoldenable
```
On your nvim do this:
* :w
* :source %

#### Step 4.1: Install vim-plug

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

#### Step 4.5: Copy the rest like this

```bash
call plug#begin()

"Topics
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'folke/tokyonight.nvim'

"Search
Plug 'junegunn/fzf.vim' "searches for files, lines
Plug 'junegunn/fzf'
Plug 'voldikss/vim-floaterm' "TERMINAL

"Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons' "to set the icon in direction

"Tmux
Plug 'yazgoo/vmux'
Plug 'christoomey/vim-tmux-navigator' "to be able to navigate between open files

"Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"TERMINAL
Plug 'erietz/vim-terminator', {'branch': 'main'} "to run programming language code

"Syntax
Plug 'sheerun/vim-polyglot' "color highlighting of programming languages
Plug 'lilydjwg/colorizer' "Hexadecimal color in css, paint
Plug 'KabbAmine/vCoolor.vim' "insert color, alt+c, alt+r; alt + v
Plug 'valloric/matchtagalways' " To shadow start and end tags
Plug 'sbdchd/neoformat' " More attractive Javascript

" IDE
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion' " Find a word on our current page <leader>s + (letter)
Plug 'Yggdroot/indentLine' " Indentation
Plug 'scrooloose/nerdcommenter' " Comments
Plug 'jiangmiao/auto-pairs' " Auto-complete braces, brackets, etc.
Plug 'osyo-manga/vim-over' " OverCommandLine %s/ ENTER word/
Plug 'tpope/vim-surround' " To enclose a word in a sign, bracket, parenthesis
" To be able to enclose a word /// ysiw + sign
" To change the sign 'hello world' to a <p>hello world</p> /// type cs'<q>
"To remove a delimiter, type ds' /// 'hello' -> hello
"To give icons to our nvim
"To replace some word, :%s/old word/new word
Plug 'tmhedberg/simpylfold' "code folding
Plug 'vim-scripts/TaskList.vim'
"todoshow for vim, all, fixme in uppercase
"works with <leader> t #exit q, keep window and go back to screen e
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hoob3rt/lualine.nvim'

call plug#end()
```
and same as before On your nvim do this:
* :w
* :source %
* :PlugInstall

#### Step 5: Create the `coc-settings.json` file
```bash
nvim ~/.config/nvim/coc-settings.json
```
* NOTE: Copy and paste the coc-settings.json file into your own file

#### Step 5.5: Install nodejs to use coc.vim

```bash
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
```

#### Add the following lines to your .zshrc file (or .bashrc if you're still using Bash):
```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
```

#### Check the installation
```bash
node -v
npm -v
```

So now you can do this in your nvim, but open your init.vim and do this:
:CocIntall coc-explorer coc-html coc-css coc-json coc-tsserver coc-eslint coc-prettier coc-snippets coc-emmet coc-pyright coc-java coc-phpls coc-vetur coc-diagnostic

> If you did everything right, you should get something like this

![image](https://github.com/JJoosh/nvim-dotefiles/assets/122099216/90a6e3fe-f034-4e2d-9fda-22c89ddf8fba)

#### Remember these are my files of how I set it up, you can move them around and change themes and shortcuts to whatever you want.
