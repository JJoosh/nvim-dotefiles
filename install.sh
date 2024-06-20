#!/bin/bash



# Función para verificar la versión de Neovim
check_nvim_version() {
  REQUIRED_VERSION="0.10.0"
  INSTALLED_VERSION=$(nvim --version | head -n 1 | awk '{print $2}')
  
  if [ "$INSTALLED_VERSION" != "$REQUIRED_VERSION" ]; then
    echo "Se requiere Neovim $REQUIRED_VERSION. Instalando/Actualizando..."
    install_nvim
  else
    echo "Neovim $REQUIRED_VERSION ya está instalado."
  fi
}

# Función para instalar o actualizar Neovim
install_nvim() {
  sudo apt update
  sudo apt install -y neovim
  
  INSTALLED_VERSION=$(nvim --version | head -n 1 | awk '{print $2}')
  if [ "$INSTALLED_VERSION" != "$REQUIRED_VERSION" ]; then
    echo "Error: no se pudo instalar Neovim $REQUIRED_VERSION."
    exit 1
  else
    echo "Neovim $REQUIRED_VERSION instalado correctamente."
  fi
}

# Verificar la versión de Neovim
check_nvim_version

# Directorio de configuración de Neovim
NVIM_CONFIG_DIR="$HOME/.config/nvim"

# Crear el directorio de configuración de Neovim si no existe
mkdir -p "$NVIM_CONFIG_DIR"

# Crear init.vim
cat << 'EOF' > "$NVIM_CONFIG_DIR/init.vim"
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
"cuando hagamos split se acomode abajo o arriba
set splitbelow
set splitright
"Para pelgar codigo de lenguaje de programacion
set foldmethod=syntax
"set foldmethod=indent
set nofoldenable 

call plug#begin()

"Themes
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'folke/tokyonight.nvim'

"Busqueda
Plug 'junegunn/fzf.vim'  "busquedas de archivos, lines
Plug 'junegunn/fzf'
Plug 'voldikss/vim-floaterm' "TERMINAL

"Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'   "para poner icono a direcotiro

"Tmux
Plug 'yazgoo/vmux'
Plug 'christoomey/vim-tmux-navigator'   "poder navegar entreeararchivos abiertos

"Autocomplementado
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"TERMINAL
Plug 'erietz/vim-terminator', { 'branch': 'main'} "ejecutar codigo de lenguajes de progra

"Sintax
Plug 'sheerun/vim-polyglot' "resalta de color los lenguajes de progra
Plug 'lilydjwg/colorizer' "Color hexadecimal en css, pinta
Plug 'KabbAmine/vCoolor.vim'   "insertar color, alt +c, atl + r; alt + v
Plug 'valloric/matchtagalways' " Para sombrear etiquetas de inicio y de salida
Plug 'sbdchd/neoformat'  "prettier javascript

"IDE
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'  "buscar una palabra en nuestra pagina actual <leader>s +(letra)
Plug 'Yggdroot/indentLine'              "indentacion
Plug 'scrooloose/nerdcommenter' "comentarios
Plug 'jiangmiao/auto-pairs'             "autocompletado de llaves, corchetes, etc
Plug 'osyo-manga/vim-over' "OverCommandLine%s/ ENTER palabra/
Plug 'tpope/vim-surround'  "Para envolver una palabra en un signo, corchete, parentesis
Plug 'tmhedberg/simpylfold' "plegado de codigo
Plug 'vim-scripts/TaskList.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hoob3rt/lualine.nvim'

call plug#end()

"Confioguraciones Extras
colorscheme tokyonight

let mapleader=","

" Configuración de coc.nvim
" Usa Enter para seleccionar el ítem del menú de autocompletado
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Usa Tab y Shift-Tab para navegar por el menú de autocompletado
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

"Colocar ; al final
nnoremap <Leader>; $a;<Esc>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

noremap <Leader>k :bnext<CR>
nmap <space>e <Cmd>CocCommand explorer<CR>

"FZF
map <Leader>p :Files<CR>
"map <Leader>ag :Ag<CR>

"termninal emulation
vnoremap <c-t> :split<CR>:ter<CR>:resize 10<CR>
nnoremap <c-t> :split<CR>:ter<CR>:resize 10<CR>

"buffers
map <Leader>bf :Buffers<cr>
"siguiente buffers y anterior buffer
nnoremap <Leader>k :bnext<CR>
nnoremap <Leader>j :bprevious<CR>
nnoremap <Leader>x :bdelete<CR>

"#solo instalar el primero copiar '+y   pegar  "+p
"sudo apt install xclip
nnoremap <Leader>y "+y<CR>

"Split
nnoremap <Leader>vs :vsp<CR>
nnoremap <Leader>sp :sp<CR>

"Para q las feclas no funcionen
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

"split resize
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

"Ajustar el tamano de las ventanas
nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up> :resize +5<CR>
nnoremap <silent> <down> :resize -5<CR>
nnoremap <Leader>e :e ~/.config/nvim/init.vim<CR>
nmap <F5> :source ~/.config/nvim/init.vim<CR>
vmap <F5> :source ~/.config/nvim/init.vim<CR>

"Elimina los comentarios con #
nnoremap <Leader>d :g/^\s*#/d<CR>
nnoremap <silent> <F2> :CocCommand explorer<CR>

"Buscamos con 2 letras un palabra en nuestro archivo
nmap <Leader>s <Plug>(easymotion-s2)

"CONFIGURACION VIM AIRLINE
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='google_dark'
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 79,
    \ 'x': 60,
    \ 'y': 88,
    \ 'z': 45,
    \ 'warning': 80,
    \ 'error': 80,
    \ }
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b' , 'c', 'x' ],
    \ [ 'z', 'error' ]
    \ ]

"CONFIGURACION FLOATERM TERMINAL
nnoremap <silent> <F1> :FloatermNew bash<CR>
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
let g:floaterm_keymap_toggle = '<F8>'

"JS FORMAT NEOFORMAT, formateador de js, ts, react
"link: https://hashrocket.com/blog/posts/writing-prettier-javascript-in-vim
let g:neoformat_try_formatprg = 1
augroup NeoformatAutoFormat
    autocmd!
    autocmd FileType javascript,typescript,javascript.jsx setlocal formatprg=prettier\
                                                            \--stdin\
                                                            \--print-width\ 80\
                                                            \--single-quote\
                                                            \--trailing-comma\ es5
    autocmd BufWritePre *.ts,*.js,*.jsx Neoformat
augroup END

nnoremap <silent> <F2> :CocCommand explorer<CR>

" Configuración de nvim-tree.lua y nvim-web-devicons usando Lua
lua << EOF
require'nvim-tree'.setup {
  -- Configuraciones adicionales
}

-- Mapeo de teclas para abrir/cerrar el árbol de archivos
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Configurar los iconos
require'nvim-web-devicons'.setup {
  default = true;
}
EOF

"Configuración de lualine usando Lua
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF
EOF

# Crear coc-settings.json
cat << 'EOF' > "$NVIM_CONFIG_DIR/coc-settings.json"
{
  "html.autoClosingTags": true,
  "html.hover.documentation": false,
  "html.format.templating": true,
  "html.format.indentInnerHtml": true,
  "snippets.priority": 1,
  "snippets.userSnippetsDirectory": "~/.config/nvim/snippets/ultisnips",
  "snippets.shortcut": "S",
  "snippets.autoTrigger": true,
  "snippets.triggerCharacters": [],
  "snippets.loadFromExtensions": true,
  "snippets.textmateSnippetsRoots": ["~/.config/nvim/snippets/textmate"],
  "snippets.ultisnips.enable": true,
  "snippets.ultisnips.usePythonx": true,
  "snippets.ultisnips.directories": ["UltiSnips"],
  "snippets.snipmate.enable": true,
  "prettier.enable": true,
  "coc.preferences.formatOnSaveFiletypes": [
    "css",
    "scss",
    "dart",
    "java",
    "php",
    "html",
    "python",
    "django",
    "htmldjango",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json"
  ],
  "emmet.excludeLanguages": ["css", "javascript"],
  "emmet.includeLanguages": {
    "htmldjango": "html",
    "javascript": "javascriptreact"
  },
  "eslint.format.enable": true,
  "eslint.run": ["onType", "onSave"],
  "eslint.probe": [
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "html",
    "vue",
    "markdown",
    "python",
    "dart",
    "css",
    "php",
    "java",
    "htmldjango",
    "djhtml"
  ],
  "codeLens.enable": true,
  "diagnostic.errorSign": "✘",
  "diagnostic.warningSign": "",
  "diagnostic.infoSign": "",
  "diagnostic.enableMessage": "always",
  "diagnostic.virtualText": false,
  "diagnostic.virtualTextCurrentLineOnly": false,
  "suggest.noselect": true,
  "suggest.enablePreselect": true,
  "suggest.completionItemKindLabels": {
    "keyword": "\uf1de",
    "variable": "\ue79b",
    "value": "\uf89f",
    "operator": "\u03a8",
    "constructor": "\uf0ad",
    "function": "\u0192",
    "reference": "\ufa46",
    "constant": "\uf8fe",
    "method": "\uf09a",
    "struct": "\ufb44",
    "class": "\uf0e8",
    "interface": "\uf417",
    "text": "\ue612",
    "enum": "\uf02c",
    "enumMember": "\uf02b",
    "module": "\uf40d",
    "color": "\ue22b",
    "property": "\ue624",
    "field": "\uf9be",
    "unit": "\uf475",
    "event": "\ufacd",
    "file": "\uf15b",
    "folder": "\uf07b",
    "snippet": " ",
    "typeParameter": "\uf728",
    "default": "\uf29c"
  },
  "diagnostic.enable": true,
  "diagnostic.enableSign": true,
  "diagnostic.level": "error",
  "intelephense.diagnostics.embeddedLanguages": true,
  "html-css-support.enabledLanguages": [
    "html",
    "vue",
    "blade",
    "htmldjango",
    "javascript",
    "typescriptreact",
    "javascriptreact"
  ],
  "explorer.focus": true,
  "explorer.previewAction.onHover": false,
  "explorer.git.icon.status.added": "✚",
  "explorer.git.icon.status.deleted": "✖",
  "explorer.git.icon.status.renamed": "➜",
  "explorer.git.icon.status.unmerged": "≠",
  "explorer.git.icon.status.untracked": "?",
  "explorer.git.icon.status.modified": "✹",
  "explorer.git.icon.status.ignored": "☒",
  "explorer.git.icon.status.mixed": "*",
  "explorer.icon.enableNerdfont": true,
  "explorer.quitOnOpen": true,
  "explorer.file.showHiddenFiles": false,
  "explorer.file.column.clip.copy": "",
  "explorer.file.column.clip.cut": "",
  "explorer.width": 30,
  "explorer.file.hiddenRules": {
    "extensions": ["o", "a", "obj", "pyc"],
    "filenames": ["\\.byebug+", "\\.DS_Store|"],
    "patternMatches": ["^\\.git$", "^\\node_modules$", "^\\plugged$"]
  },
  "explorer.keyMappings.global": {
    "i": false,
    "<c-o>": "noop",
    "1": "toggleSelection",
    "<tab>": "actionMenu",
    "gk": ["wait", "expandablePrev"],
    "gj": ["wait", "expandableNext"],
    "h": ["wait", "collapse"],
    "l": ["wait", "expandable?", "expand", "open"],
    "J": ["wait", "toggleSelection", "normal:j"],
    "K": ["wait", "toggleSelection", "normal:k"],
    "gl": ["wait", "expand:recursive"],
    "gh": ["wait", "collapse:recursive"],
    "<2-LeftMouse>": [
      "expandable?",
      ["expanded?", "collapse", "expand"],
      "open"
    ],
    "o": ["wait", "expanded?", "collapse", "expand"],
    "C": ["wait", "expandable?", "cd", "open"],
    "e": "open",
    "s": "open:split",
    "v": "open:vsplit",
    "t": "open:tab",
    "u": ["wait", "gotoParent"],
    "gs": ["wait", "reveal:select"],
    "il": "preview:labeling",
    "ic": "preview:content",
    "Il": "previewOnHover:toggle:labeling",
    "Ic": "previewOnHover:toggle:content",
    "II": "previewOnHover:disable",
    "yp": "copyFilepath",
    "yn": "copyFilename",
    "yy": "copyFile",
    "dd": "cutFile",
    "p": "pasteFile",
    "df": "delete",
    "d": "deleteForever",
    "a": "addFile",
    "A": "addDirectory",
    "r": "rename",
    "zh": "toggleHidden",
    "g<dot>": "toggleHidden",
    "R": "refresh",
    "?": "help",
    "q": "quit",
    "<esc>": "esc",
    "X": "systemExecute",
    "gd": "listDrive",
    "f": "search",
    "F": "searchRecursive",
    "gf": "gotoSource:file",
    "gb": "gotoSource:buffer",
    "[[": ["wait", "sourcePrev"],
    "]]": ["wait", "sourceNext"],
    "[i": ["wait", "indentPrev"],
    "]i": ["wait", "indentNext"],
    "[m": ["wait", "markPrev:modified"],
    "]m": ["wait", "markNext:modified"],
    "[d": ["wait", "markPrev:diagnosticError:diagnosticWarning"],
    "]d": ["wait", "markNext:diagnosticError:diagnosticWarning"],
    "[D": ["wait", "markPrev:diagnosticError"],
    "]D": ["wait", "markNext:diagnosticError"],
    "[c": ["wait", "markPrev:git"],
    "]c": ["wait", "markNext:git"],
    "<<": "gitStage",
    ">>": "gitUnstage"
  },
  "explorer.file.root.template": "[icon & 1] PROJECT ([root])",
  "explorer.buffer.root.template": "[icon & 1] OPEN EDITORS",
  "explorer.file.child.template": "[git | 2] [selection | clip | 1] [indent][icon | 1] [diagnosticError & 1][filename omitCenter 1][modified][readonly] [linkIcon & 1][link growRight 1 omitCenter 5]",
  "tabnine.disable_file_regex": [
    "[.]md$",
    "[.]html$",
    "[.]txt$",
    "[.]php$",
    "[.]css$",
    "[.]scss$",
    "[.]dart$",
    "[.]js$",
    "[.]ts$",
    "[.]java$"
  ],
  "javascript.referencesCodeLens.enable": false,
  "typescript.referencesCodeLens.enable": false,
  "cssmodules.camelCase": true,
  "cssmodules.hintName": " cssmodules ",
  "html-css-support.enabledLanguages": [
    "html",
    "vue",
    "blade",
    "htmldjango",
    "typescriptreact",
    "javascriptreact"
  ]
}
EOF

# Instalar vim-plug si no está instalado
if [ ! -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
  curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Instalar plugins
nvim +PlugInstall +qall

echo "Configuración de Neovim completada!"

