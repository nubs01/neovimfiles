set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree.git'
" Plugin 'https://github.com/davidhalter/jedi-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'MatlabFilesEdition'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'jpalardy/vim-slime.git'
" Plugin 'severin-lemaignan/vim-minimap'
Plugin 'dracula/vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'

" Rainbow parenthesis
Plugin 'https://github.com/kien/rainbow_parentheses.vim'

" Easy Align Tool (activated by ga global align)
Plugin 'https://github.com/junegunn/vim-easy-align'
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)

" Colorschemes
Plugin 'flazz/vim-colorschemes'

call vundle#end()
filetype plugin indent on

" Begin Configurations 

set encoding=utf-8
set laststatus=2
set t_Co=256
set number
set tabstop=4
set expandtab
set shiftwidth=4
set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp

let python_highlight_all=1
syntax on
"colo railscasts
"colo d8g_03
"colo radicalgoodspeed
colo rainbow_night

" Tagbar shortcut
nmap <F8> :TagbarToggle<CR>

" For YouCompleteMe clangd setting
let g:ycm_use_clangd = 0

" Add matlab linter for syntastic
let g:syntastic_matlab_mlint_exec = "/usr/local/MATLAB/R2017b/bin/glnxa64/mlint"

" Rainbow Parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 1
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Vim-airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='simple'

" Vim-devicons config
set guifont=FuraMono\ Nerd\ Font:h14
"let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['m'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['mat'] = ''

" Vim-nerdtree-syntax-highlighting config
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['m'] = s:lightPurple
let g:NERDTreeExtensionHighlightColor['mat'] = s:salmon
let g:NERDTreeFileExtensionHighlightFullName = 1

" vim-slime configurations
if exists("$TMUX")
    let g:slime_target = 'tmux'
    let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.2"}
endif

" Custom Key mappings

" List matlab function in file
nmap <leader>L :g/function/#<CR>

" Figlet shortcut
nmap <leader><C-f> :r!figlet -f univers -c '
vmap <leader>F :!figlet -f slant -c<CR>

" NERDtree Mappings
map <C-n> :NERDTreeToggle<CR>

" Mouse Mode Toggle
map <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
imap <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
function ShowMouseMode()
	if (&mouse == 'a')
            echo "mouse-vim"
	else
            echo "mouse-xterm"
        endif
endfunction

" Syntax Highlighting to specific files
au BufReadPost .setupCommands* set syntax=sh

" SimpylFold Tab Toggle
noremap <space> za
" Keep docstrings
let g:SimpylFold_docstring_preview=1

" Tab movement mapping
nnoremap <leader>] :tabn<SPACE>
nnoremap <leader>[ :tabn<ENTER>

" Session Mapping
nnoremap <leader>o :OpenSession<ENTER>

" Save session settings
set ssop-=options
set ssop-=folds

" Setting for vim-session
let g:session_directory="~/.vim/sessions"
let g:session_default_name="LastSession"
let g:session_default_overwrite=1
let g:session_autosave='no'
let g:session_autoload='no'

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" disable syntastic for python file (so it doesn't collide with jedi)
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

" python PEP8 file formatting
au BufNewFile, BufRead *.py 
            \ set tabstop=4 
            \ softtabstop=4 
            \ shiftwidth=4
            \ textwidth=79
            \ expandtab
            \ autoindent
            \ fileformat=unix

" file formatting for web development
au BufNewFile, BufRead *.js, *.html, *.css
            \ set tabstop=2
            \ softtabstop=2
            \ shiftwidth=2

" Flagging extra whitespace
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h 
            \ match BadWhitespace /|s|+$/
