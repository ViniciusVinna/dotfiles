" Configuration to make vim more useful

" Compatibility
set nocompatible

" Enable syntax highlighting
set t_Co=256
set background=dark
syntax on
colorscheme badwolf

" Configure Pathogen
filetype off
call pathogen#infect()
filetype plugin indent on

" Set mapleader
let mapleader=","

" Set directories for backup, swap and undo files
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" Set general options
set autoindent " Copy indent from last line when starting new line.
set backspace=indent,eol,start
set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
set esckeys " Allow cursor keys in insert mode.
set expandtab " Expand tabs to spaces
set foldcolumn=4 " Column to show folds
set foldenable
set foldlevel=2
set foldmethod=syntax " Markers are used to specify folds.
set foldminlines=0 " Allow folding single lines
set foldnestmax=3 " Set max fold nesting level
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle.
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches.
set incsearch " Highlight dynamically as pattern is typed.
set laststatus=2 " Always show status line
set lispwords+=defroutes " Compojure
set lispwords+=defpartial,defpage " Noir core
set lispwords+=defaction,deffilter,defview,defsection " Ciste core
set lispwords+=describe,it " Speclj TDD/BDD
set magic " Enable extended regexes.
set mouse=a " Enable moouse in all in all modes.
set noerrorbells " Disable error bells.
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command.
set nostartofline " Don't reset cursor to start of line when moving around.
set nowrap " Do not wrap lines.
set nu " Enable line numbers.
set ofu=syntaxcomplete#Complete " Set omni-completion method.
set report=0 " Show all changes.
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window.
set shiftwidth=2 " The # of spaces for indenting.
set shortmess=atI " Don't show the intro message when starting vim.
set showmode " Show the current mode.
set showtabline=2 " Always show tab bar.
set sidescrolloff=3 " Start scrolling three columns before vertical border of window.
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters.
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set softtabstop=2 " Tab key results in 2 spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set title " Show the filename in the window titlebar.
set ttyfast " Send more characters at a given time.
set ttymouse=xterm " Set mouse type to xterm.
set undofile " Persistent Undo.
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line.
set wildmode=list:longest " Complete only until point of ambiguity.
set winminheight=0 " Allow splits to be reduced to a single line.
set wrapscan " Searches wrap around end of file

" Set relative line numbers
set relativenumber " Use relative line numbers. Current line is still in status bar.
au BufReadPost,BufNewFile * set relativenumber

" Speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Faster split resizing (+,-)
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <vnoremap <leader>rp :RainbowParenthesesLoadRound<CR>
vnoremap <leader>rp :RainbowParenthesesLoadSquare<CR>
vnoremap <leader>rp :RainbowParenthesesLoadBraces<CR>

" SnipMate
let g:snippets_dir = "~/.vim/snippets/"

" EasyMotion
map <Leader><Leader>w <Plug>(easymotion-prefix)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)

" NERDTree
let NERDTreeWinSize=31
let NERDTreeIgnore=['\\.pyc$','\\.pyo$','\\~$','\\#$','\\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeWinPos="left"
let NERDTreeHighlightCursorline=1
map <Leader>n :NERDTreeToggle<CR>
map <C-t> :NERDTreeFind<CR>
autocmd vimenter * if !argc() | NERDTree | endif

" BufExplorer
let g:bufExplorerSplitRight = 1
let g:bufExplorerSplitBelow = 1
map <Leader>b :BufExplorer<CR>

" BufKill
map <Leader>x :BufKill<CR>

" Gundo
map <Leader>u :GundoToggle<CR>

" Ack.vim
let g:ackprg = 'ack-grep -H --nocolor --nogroup --column'

" Vim-Ruby
let g:ruby_operators = 0
let g:ruby_no_expensive = 1

" Pydiction
let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
let g:pydiction_menu_height = 15

" MRU
let MRU_File = '~/.vim_mru_files'

" Command-T
let g:CommandTMaxHeight = 15
let g:CommandTMaxFiles = 0 " All files

" NetRW
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_winsize = 25
let g:netrw_altv = 1

" Startify
let g:startify_files_number = 5
let g:startify_enable_special = 0

" Fugitive
set statusline+=%#warningmsg#
set statusline+=%{FugitiveStatusline()}

" Multiple cursors
let g:multi_cursor_start_word_key = '<c-s>'
let g:multi_cursor_select_all_word_key = '<a-s>'
let g:multi_cursor_start_key = 'g<c-s>'
let g:multi_cursor_select_all_key = 'g<a-s>'
let g:multi_cursor_next_key = '<c-n>'
let g:multi_cursor_prev_key = '<c-p>'
let g:multi_cursor_skip_key = '<c-x>'
let g:multi_cursor_quit_key = '<Esc>'

" Endwise
let g:endwise_no_mappings = 1

" ConqueTerm
let g:ConqueTerm_ColorScheme = 'default'
let g:ConqueTerm_ChdirAtEntry = 0
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_PrintWarnings = 0
let g:ConqueTerm_SendEsc = "\<Esc>"
let g:ConqueTerm_TerminalClose = 'close'
let g:ConqueTerm_ReadUnfocused = 0
let g:ConqueTerm_ReadUnfocusedSlow = 0

" Airline
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#checks = ['trail', 'eol']
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_powerline_fonts = 1

" GitGutter
let g:gitgutter_eager = 0
let g:gitgutter_highlights_all_lines = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgvnoremap <leader>rp :<C-U>RainbowParenthesesLoadRound<CR>

" LaTeX
set tw=79 " Set textwidth to 79 columns (good for LaTeX)
let g:Tex_DefaultTargetFormat = 'pdf' " Default to PDF output
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*' " Use XeTeX as default typesetter
let g:Tex_IgnoredWarnings =
\ '\v: print bib <return> citation NO\.(citation|file)\s*:\s*(\(\.\*\)\s*)?on (input|page)'

" gitconfig files
au BufRead,BufNewFile .gitmodules,.gitignore_global,.gitconfig,.gitattributes,.gitignore set ft=git

" MacVim: Open files in tabs, not windows
au BufEnter * if tabpagenr('$') > 1 | tab ball | tabfirst | endif

" NERDTree
map <C-t> :NERDTreeToggle<CR>
" Ignore files
let NERDTreeIgnore=['\~$', '\.o$', '\.class$', '^\.git$', '^\.hg$', '^\.svn$', '\.pyc$', '\.rbc$']
" Start hidden
let NERDTreeQuitOnOpen = 1
" Don't change the CWD
let NERDTreeChDirMode = 0
" Don't open on vim start
let g:nerdtree_tabs_open_on_console_startup=0

" ----------------- Color -----------------
" Jellybeans
let g:jellybeans_overrides = { '*': { 'guifg': '#cccccc', 'guibg': '#151515' } }
let g:jellybeans_gvim_statusline_bold = 0

" Solarized
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" let g:solarized_termtrans = 1
" colorscheme solarized
" set background=dark
" :hi link Operator String
" :hi link Statement String

" Easymotion
" :map <Leader><Leader> <Plug>(easymotion-prefix)

" ----------------- Keybinds -----------------
" Remap Ctrl-P to CtrlP plugin
map <C-p> :CtrlP<CR>
" Toggle comment lines
nnoremap <C-/> :NERDComment<CR>

" ----------------- Syntastic -----------------
" let g:syntastic_mode_map = { 'mode': 'active',
\ 'active_filetypes': [], 'passive_filetypes': ['html', 'xml'] }
" let g:syntastic_ruby_checkers = ['rubocop', 'ruby']

" ----------------- Solarized Config -----------------
" let g:solarized_termcolors=16
" let g:solarized_termtrans = 1

" ----------------- Personal Preference -----------------
" Always paste in command-line mode
" :cnoremap <C-v> <C-r>+

" ----------------- Surround -----------------
" Change surroundings easily
" nmap cs <Plug>VSurround
" nmap ds <Plug>DSurround
" nmap yss <Plug>YSsurround
" nmap yS <Plug>YSsurround
" nmap yss <Plug>YSssurround
" nmap ySs <Plug>YSssurround
" nmap ySS <Plug>YSssurround

" ----------------- Unite -----------------
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])

" ----------------- EasyMotion -----------------
" map <Leader> <Plug>(easymotion-prefix)

" ----------------- Powerline -----------------
" let g:Powerline_symbols = 'fancy'

" ----------------- Python Mode -----------------
" let g:pymode_rope_lookup_project = 0
" let g:pymode_doc = 0
" let g:pymode_lint_checker = "pyflakes,pep8"
" let g:pymode_options_max_line_length = 79
" let g:pymode_lint_write = 1

" ----------------- Airline -----------------
" let g:airline_theme='jellybeans'
" let g:airline_powerline_fonts = 1

" ----------------- Tagbar -----------------
" nmap <F8> :TagbarToggle<CR>
" let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
" let g:tagbar_width=35

" ----------------- Gundo -----------------
" map <F5> :GundoToggle<CR>

" ----------------- DelimitMate -----------------
" let delimitMate_expand_cr = 1

" ----------------- UltiSnips -----------------
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ----------------- Python -----------------
" python << EOF
" import os.path
" import sys
" sys.path.append(os.path.expanduser('~/.vim/bundle/pylint-vim'))
" EOF

" ----------------- Neocomplete -----------------
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 3

" ----------------- Haskell -----------------
" let g:haskellmode_completion_ghc = 1

" ----------------- HTML5 -----------------
" augroup HTML5
"   autocmd!
"   autocmd FileType html,eruby setlocal omnifunc=htmlcomplete#CompleteTags
"   autocmd FileType html,eruby setlocal syntax=html5
"   autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"   autocmd FileType javascript setlocal syntax=javascript
"   autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" augroup END

" ----------------- CoffeeScript -----------------
" let coffee_compile_on_save = 1

" ----------------- ERB -----------------
" let g:eruby_compiler = "erubis"

" ----------------- Go -----------------
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_interfaces = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
