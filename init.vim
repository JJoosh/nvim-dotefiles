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
"Para poder envolver una palabra /// ysiw + signo
"Para cambiar de signo 'hello world' a un <p>hello world</p> /// digitamos cs'<q>
"Para eliminar un delimitador digitamos ds' /// 'hello' -> hello
"Para dar iconos a nuestros nvim
"Para reemplazar alguna palabra,  :%s/palbra antigua/palabra nueva
Plug 'tmhedberg/simpylfold' "plegado de codigo
Plug 'vim-scripts/TaskList.vim'
"todoshow para vim, todo,fixme en mayuscula
"funciona con <leader> t  #salir q, mantener ventana y volver a pantalla e
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hoob3rt/lualine.nvim'

call plug#end()

"Confioguraciones Extras
"Confioguraciones Extras
colorscheme tokyonight

"MOLOKAI THEME
"let g:molokai_original = 1
"let g:rehash256 = 1
"colorscheme molokai



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



"##################################################################
"CONFIGURACION VIM AIRLINE
"##################################################################
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='google_dark'

"let g:airline_statusline_ontop=0

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


"#######################################
"CONFIGURACION FLOATERM TERMINAL
"#######################################
nnoremap <silent> <F1> :FloatermNew bash<CR>
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
let g:floaterm_keymap_toggle = '<F8>'


"##################################################################
"CONFIGURACION VIM AIRLINE
"##################################################################
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='google_dark'

"#######################################
"JS FORMAT NEOFORMAT, formateador de js, ts, react
"#######################################
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

"Abrir coc-explorer al inicio
"autocmd VimEnter * CocCommand explorer


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
