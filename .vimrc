" Basic settings
syntax on                   " Enable syntax highlighing.
filetype plugin indent on   " Enable filetype-specific indentation/plugins.
set number                  " Enable line numbers.
set ruler                   " Show cursor position in bottom right.
set showcmd                 " Show command being typed in bottom right.
set wildmenu                " Show fancy autocompetion menu for opening files.
set wildmode=list:longest,full  " Configure wildmenu behavior.
set wrap                    " Enable line wrapping.
set lazyredraw              " Only redraw screen when needed.
set showmatch               " Highlight matching parens/brackets.
set encoding=utf-8          " Use UTF-8 encoding.
set laststatus=2            " Always show status line.
set visualbell              " Flash the screen instead of beeping
set t_vb=                   " Disable screen flashing by remapping its terminal code.
set confirm                 " Prompt to save changes instead of erroring out.
set hidden                  " Hide rather than close buffers with unsaved changes.

" Indentation settings
set tabstop=4       " Visual width of the tab character.
set softtabstop=4   " Number of spaces used for tab.
set shiftwidth=4    " Indentation width used by >>, etc.
set expandtab       " Use spaces instead of tabs.
set autoindent      " Use indentation level from previous line.
set smartindent     " Use syntax-based automatic indentation.

" Search settings
set ignorecase  " Make searches case-insensitive by default.
set smartcase   " Switch to case-sensitivity if the pattern includes an uppercase character.
set incsearch   " Show search results as you type.
set hlsearch    " Highlight search matches.

" Make <Ctrl-L> (clear screen) also turn off search highlighting.
:nnoremap <C-l> :nohl<CR><C-l>