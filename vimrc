" Basic Settings
set nocompatible              " Don't try to be vi compatible
set number                    " Show line numbers
set ruler                     " Show file stats
set laststatus=2              " Always display the status line
set background=dark           " Set background to dark

" Performance Optimization: Disable filetype before plugin load
filetype off                  " Helps force plugins to load correctly

" Plugin Management
call plug#begin('~/.vim/plugged')
" Theme
Plug 'drewtempelmeyer/palenight.vim'
" Nerd commenter and NERDTree
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
" Prettier integration
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" Logstash syntax
Plug 'robbles/logstash.vim'
" Surround plugin
Plug 'tpope/vim-surround'
" Auto pairs for parentheses
Plug 'jiangmiao/auto-pairs'
" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

" Key Mappings
" Remap escape sequence
imap jk <Esc>
" Clear search highlighting with return key
nnoremap <CR> :noh<CR><CR>
" Sudo write command
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Visual Settings
syntax on                     " Turn on syntax highlighting
set t_Co=256                  " Color scheme (terminal)
set listchars=tab:▸\ ,eol:¬   " Visualize tabs and newlines
colorscheme palenight         " Set color scheme

" Comments for Documentation
" This section includes detailed comments explaining why each setting or plugin is used.

" Filetype and Indentation Settings
filetype plugin indent on     " Enable filetype detection, plugins, and indenting
set smartindent              " Smart indenting on new lines
set tabstop=4                " Number of spaces in a tab
set shiftwidth=4             " Number of spaces to use for autoindent
set expandtab                " Convert tabs to spaces

" Searching Settings
set hlsearch                 " Highlight all search results
set incsearch                " Show search results as you type
set ignorecase               " Ignore case when searching
set smartcase               " Override 'ignorecase' when search contains uppercase

" Color Scheme and Terminal Settings
if (has("termguicolors"))
  set termguicolors          " Enable true color support
endif

" End of Vim Configuration
