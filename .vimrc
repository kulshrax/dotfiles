" Basic settings
syntax on " Enable syntax highlighting.
filetype plugin indent on " Enable filetype-specific indentation/plugins.
set number " Enable line numbers.
set ruler " Show cursor position in bottom right.
set showcmd " Show command being typed in bottom right.
set wildmenu " Show fancy autocompetion menu for opening files.
set wildmode=list:longest,full  " Configure wildmenu behavior.
set wrap " Enable line wrapping.
set lazyredraw " Only redraw screen when needed.
set showmatch " Highlight matching parens/brackets.
set encoding=utf-8 " Use UTF-8 encoding.
set laststatus=2 " Always show status line.
set visualbell " Flash the screen instead of beeping
set t_vb= " Disable screen flashing by remapping its terminal code.
set confirm " Prompt to save changes instead of erroring out.
set hidden " Hide rather than close buffers with unsaved changes.
set backspace=indent,eol,start "Allow backspace in insert mode.
set colorcolumn=80,100 " Draw ruler line at 80 and 100 lines.
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey "Set highlight color to grey.

" Indentation settings
set tabstop=4 " Visual width of the tab character.
set softtabstop=4 " Number of spaces used for tab.
set shiftwidth=4 " Indentation width used by >>, etc.
set expandtab " Use spaces instead of tabs.
set autoindent " Use indentation level from previous line.
set smartindent " Use syntax-based automatic indentation.

" Search settings
set ignorecase " Make searches case-insensitive by default.
set smartcase " Enable case-sensitivity if the pattern has an uppercase character.
set incsearch " Show search results as you type.
set hlsearch " Highlight search matches.

" Delete trailing whitespace on save.
autocmd BufWritePre * :%s/\s\+$//e

" Use Monokai color scheme from https://github.com/crusoexia/vim-monokai
colorscheme monokai

" Set leader key to ','.
let mapleader = ","

" Make <Ctrl-L> (clear screen) also turn off search highlighting.
:nnoremap <C-l> :nohl<CR><C-l>

" Remap <Ctrl-\> to <Esc>. This is useful when using a Kinesis Advantage
" keyboard, which has '\' in the spot where '[' is located on a standard US
" keyboard (namely, to the immediate right of 'p'). This means that the muscle
" memory for <Ctrl-[> on a regular keyboard can be used on a Kinesis Advantage.
:inoremap <C-BSlash> <Esc>

" Load plugins using vim-plug.
call plug#begin('~/.local/share/nvim/site/plugged')

" Rust language support.
Plug 'rust-lang/rust.vim'

" Fuzzy file search.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Directory tree explorer.
Plug 'preservim/nerdtree'

call plug#end()

" Rust plugin settings.
let g:rustfmt_autosave = 1 " Auto-format Rust files on save.

" Key bindings for fzf.
" :nnoremap <c-p> :Files<cr>
:nmap <leader>f :Files<cr>
:nmap <leader>b :Buffers<cr>

" Key bindings for NERDTree.
nmap <leader>t :NERDTreeToggle<cr> <c-w><c-p>
nmap <leader>r :NERDTreeFind<cr> <c-w><c-p>

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 &&
    \ exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window,
" and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' &&
    \ bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() |
    \ buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

