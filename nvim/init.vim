runtime! archlinux.vim
filetype plugin indent on

"{{{ PLUGINS
call plug#begin('~/.vim/plugged')

" COLORSCHEMES {{{
Plug 'https://github.com/vim-scripts/ScrollColors'
Plug 'arcticicestudio/nord-vim'
let g:nord_comment_brightness = 20
Plug 'https://github.com/morhetz/gruvbox'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1
Plug 'https://github.com/joshdick/onedark.vim'
Plug 'https://github.com/jdkanani/vim-material-theme'
Plug 'https://github.com/ajmwagar/vim-deus'
Plug 'Rigellute/rigel'
Plug 'https://github.com/andreypopp/vim-colors-plain'
Plug 'KeitaNakamura/neodark.vim'
Plug 'junegunn/seoul256.vim'
Plug 'https://github.com/drewtempelmeyer/palenight.vim'
Plug 'https://github.com/fatih/molokai'
Plug 'https://github.com/sts10/vim-pink-moon'
Plug 'https://github.com/rakr/vim-two-firewatch'
Plug 'https://github.com/tyrannicaltoucan/vim-quantum'
Plug 'https://github.com/lifepillar/vim-wwdc16-theme'
Plug 'https://github.com/kamwitsta/nordisk'
Plug 'https://github.com/kristijanhusak/vim-hybrid-material'
Plug 'https://github.com/nightsense/stellarized'
Plug 'https://github.com/nightsense/rusticated'
Plug 'https://github.com/yuttie/inkstained-vim'
Plug 'https://github.com/Nequo/vim-allomancer'
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
Plug 'https://github.com/kamwitsta/flatwhite-vim'
Plug 'sainnhe/vim-color-forest-night'
Plug 'https://github.com/relastle/bluewery.vim'
" Plug 'crusoexia/vim-monokai'
" Plug 'https://github.com/jlesquembre/base16-neovim'
Plug 'https://github.com/flrnd/plastic.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'https://github.com/sainnhe/gruvbox-material'
Plug 'https://github.com/sainnhe/edge'
let g:edge_disable_italic_comment = 1
Plug 'https://github.com/sainnhe/neon'
let g:neon_disable_italic_comment = 1
Plug 'https://github.com/sainnhe/gruvbox-material'
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_bold = 1
Plug 'https://github.com/lifepillar/vim-solarized8'
Plug 'https://github.com/YorickPeterse/happy_hacking.vim'


"}}}

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
" Plug 'junegunn/vim-peekaboo'

" UTIL {{{
Plug 'https://github.com/tpope/vim-fugitive'
" TODO: map something to :Gbrowse
Plug 'https://github.com/tpope/vim-rhubarb'
Plug 'https://github.com/mhinz/vim-signify'

" UNIX helpers: Move, Rename, Delete, Chmod, SudoWrite
" TODO: map something to :Delete! and maybe Rename
Plug 'https://github.com/tpope/vim-eunuch'

" TESTING: Set 'path' dynamically instead of using set path=.,,**
Plug 'https://github.com/tpope/vim-apathy'

"}}}

" UI {{{
Plug 'pacha/vem-tabline'
let g:vem_tabline_show = 2
let g:vem_tabline_multiwindow_mode = 0

Plug 'https://github.com/scrooloose/nerdtree'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowFiles = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeAutoDeleteBuffer = 1
au StdinReadPre * let s:std_in=1

" Plug 'https://github.com/majutsushi/tagbar'
Plug 'liuchengxu/vista.vim'
let g:vista_stay_on_open = 0
let g:vista_icon_indent = [" » ", "\t"]
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
            \ 'scala': 'coc',
            \ 'vim': 'ctags',
            \ }
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 0

" Plug 'https://github.com/thaerkh/vim-indentguides'
" let g:indentguides_ignorelist = ['help']
" let g:indentguides_spacechar = ' '
" let g:indentguides_tabchar = '|'

Plug 'https://github.com/jeetsukumaran/vim-filebeagle'
let g:filebeagle_suppress_keymaps = 1
nnoremap <silent> - :FileBeagleBufferDir<CR>

"}}}

" EDITING {{{
Plug 'wellle/targets.vim'
let g:targets_quotes = '"d ''q `'
let g:targets_pairs = '()b {}B []r <>'

Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/machakann/vim-sandwich/'

Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/kana/vim-textobj-entire'
Plug 'https://github.com/kana/vim-textobj-indent'
" Plug 'https://github.com/kana/vim-textobj-function'
Plug 'https://github.com/Julian/vim-textobj-variable-segment'

Plug 'maxbrunsfeld/vim-yankstack'
let g:yankstack_map_keys = 0
let g:yankstack_yank_keys = ['y', 'Y', 'd', 'D']

Plug 'https://github.com/tommcdo/vim-exchange'

Plug 'https://github.com/AndrewRadev/splitjoin.vim'
nnoremap <M-J> J
fun! BreakHere()
    s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
    call histdel("/", -1)
endf
nnoremap <silent> <M-K> :<C-u>call BreakHere()<CR>
" Fallback to m-J/normal J
let g:splitjoin_split_mapping = '<m-K>'
let g:splitjoin_join_mapping = '<m-J>'
" No fallback
" nnoremap <silent> <m-J> :SplitjoinJoin<CR>
" nnoremap <silent> <m-K> :SplitjoinSplit<CR>

Plug 'https://github.com/FooSoft/vim-argwrap'
nnoremap gw :ArgWrap<CR>

Plug 'junegunn/vim-easy-align'
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" TODO: problem with backspace consuming the next newline on comments
Plug 'https://github.com/jiangmiao/auto-pairs'
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutBackInsert = ''
let g:AutoPairsMapCh = 0
let g:AutoPairsMoveCharacter = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutFastWrap = ''

" Plug 'https://github.com/AndrewRadev/sideways.vim'
" " disse funker bare for lister/argumenter?
" nnoremap <silent> <c-m-b> :SidewaysLeft<CR>
" nnoremap <silent> <c-m-f> :SidewaysRight<CR>
" TODO:
" funker dÃ¥rlig nÃ¥r:
" ordet er siste pÃ¥ en linje (kopierer med space pÃ¥ starten istedetfor slutten)
" du flytter ordet til siste pÃ¥ en linje (hopper over linja fordi next word
" ikke finnes)
" MÃ¥ lage funksjoner som sjekker innholdet av registeret for posisjon av
" space, og om neste ord er siste pÃ¥ linja (mÃ¥ da gÃ¥ til slutten av linja,
" prepende en space til registeret, fjerne space pÃ¥ slutten av registeret, og
" paste)
nnoremap <m-F> daWWPB
nnoremap <m-B> daWBPB

"}}}

Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1

Plug 'https://github.com/romainl/vim-qf'
let g:qf_mapping_ack_style = 1
let g:qf_max_height = 15

Plug 'junegunn/vim-slash'
" Plug 'unblevable/quick-scope'
Plug 'justinmk/vim-sneak'
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
highlight link Sneak IncSearch


" LANGUAGE SUPPORT {{{
Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/derekwyatt/vim-scala'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Plug 'https://github.com/metakirby5/codi.vim'
" nnoremap something :Codi!!<CR>
Plug 'https://github.com/gabrielelana/vim-markdown'
let g:markdown_enable_spell_checking = 0
Plug 'https://github.com/dkarter/bullets.vim'
let g:bullets_enabled_file_types = [
            \ 'markdown',
            \ 'text',
            \ 'gitcommit',
            \ 'Scratch'
            \]

Plug 'https://github.com/honza/vim-snippets'

" ULTISNIPS {{{
Plug 'https://github.com/SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<NUL>"
" let g:UltiSnipsJumpForwardTrigger="<M-f>"
" let g:UltiSnipsJumpBackwardTrigger="<M-b>"
" let g:UltiSnipsRemoveSelectModeMappings = 0
" let g:UltiSnipsMappingsToIgnore = ['<Tab>']
nnoremap <m-e> :Snippets<CR>
"}}}

Plug 'dense-analysis/ale'
nnoremap <silent> æ :ALENextWrap<CR>
nnoremap <silent> Æ :ALEPreviousWrap<CR>
nnoremap <silent> gæ :ALEDetail<CR>
" Disable ALE for certain languages and use coc instead
let g:ale_linters = {
\   'scala': [''],
\}
" TODO: use loclist and find mappings for lnext/lprev
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
"}}}

" LSP {{{

Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-tag', {'do': 'yarn install --frozen-lockfile'}
" let g:coc_global_extensions = ['coc-json', 'coc-snippets', 'coc-tag']
" call coc#add_extension('coc-json', 'coc-snippets', 'coc-tag')

" Highlight comments in CocConfig
au FileType json syntax match Comment +\/\/.\+$+

" Don't use coc#_select_confirm (performs completion when not asked to) 
" Don't use coc#on_enter (only used for formatOnType)
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>\<CR>" : "\<C-g>u\<CR>"

" TAB: next or tab or trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" STAB: previous or backspace
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Check whether cursor at word end
fun! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endf

imap <M-e> <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<m-f>'
let g:coc_snippet_prev = '<m-b>'

fun! CocOptions()
    set updatetime=300
    set nobackup
    set nowritebackup
endf

" Help DWIM
nnoremap <silent> <m-h> :call <SID>show_documentation()<CR>
fun! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endf

"}}}

call plug#end()
"}}}

" OPTIONS {{{
set mouse=a
set winaltkeys=no
set backspace=indent,eol,start

set hidden
set switchbuf=usetab
set autoread

set tags=./tags;/

" INFO: Using vim-apathy instead, which should make it possible to :find, gf,
" :isplit and so on to included files (standard library at least, but maybe
" also for the current project?) However, go to symbol/tag is better than
" :ijump, and these things are probably better solved by a langserver or ctags anyway.
" set path=**
" Go back to this if something fails
" set path=.,,**

" Ingore case when completing filenames and directories
set wildignorecase

set encoding=utf8
set fileencoding=utf8

" This directory must be writable
set backup
set backupdir=/var/tmp/nvim
set swapfile
set directory=/var/tmp/nvim
set undofile
set undodir=/var/tmp/nvim

call CocOptions()

set number
set relativenumber
set title
set cursorline
set listchars=tab:\ \ ,nbsp:␣,trail:·,extends:›,precedes:‹
" No vim intro or completion messages
set shortmess+=cI
" No ~ in end of buffer
set fillchars=eob:\ 

set notimeout
set lazyredraw

set ignorecase
set smartcase

set tabstop=4 shiftwidth=4
set expandtab
set smarttab

" set autoindent
" set smartindent
set cindent    " should override smartindent and autoindent
set copyindent " use same type of indentation (spaces/tabs) as previous line

set wrap
set linebreak
set breakindent " align wrapped lines with indentation (may require tweaking)

set nojoinspaces

set startofline
set splitright
set splitbelow
set diffopt+=vertical

set scrolloff=5
" set scrolloff=999
set sidescrolloff=3

set nohlsearch
set gdefault
set inccommand=split

" Do not store options in session
set sessionoptions-=options,folds,help

"}}}

" STATUSLINE {{{
set noshowmode
set statusline=
set statusline+=%#title#\ %f\ %*
" Should have a trailing newline
set statusline+=%2*[%n%M%R%W%q]\ %*\ 
set statusline+=%{coc#status()}
" set statusline+=%#question#%{getcwd()}\ " working directory
set statusline+=\ %m
set statusline+=%=
" set statusline+=\ %{strftime('%R',getftime(expand('%')))}
set statusline+=%=%y%*%*     " file type
" set statusline+=\ %{(&fenc!=''?&fenc:&enc)}
set statusline+=%10(%l:%c%)  " line and column
" set statusline+=\ %L\       " total lines
set statusline+=\ ‹\ %P
set statusline+=\ %*
"}}}

" COLOR {{{
syntax enable
set background=dark

if has('termguicolors')
    set termguicolors
    " Should this be set even when termguicolors not available?
    if exists('$TMUX')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
endif

" let g:dark='gruvbox-material'
let g:dark='base16-tomorrow-night'
let g:light='tempus_dawn'
let g:fallback='gruvbox'

fun! SetColors()
    if &termguicolors == 0
        let g:theme=g:fallback
    elseif exists('b:textfile')
        let g:theme=g:light
        set background=light
    elseif !empty($VIM_COLORS)
        let g:theme=$VIM_COLORS
        execute 'set background=' . $VIM_BG
    else
        if $MOOD == "light"
            let g:theme=g:light
            set background=light
        else
            let g:theme=g:dark
            set background=dark
        endif
    endif
    execute 'colorscheme ' . g:theme
endf

let g:favorite_colors = [
            \ "material-theme",
            \ "deus",
            \ "onedark",
            \ "two-firewatch",
            \ "allomancer",
            \ "forest-night",
            \ "flatwhite",
            \ "orange-moon",
            \ "nordisk",
            \ "neodark",
            \ "base16-tomorrow-night",
            \ "hybrid_material",
            \ "rigel",
            \ "molokai",
            \ "palenight",
            \ "seoul256",
            \ "seoul256-light",
            \ ]

fun! CRotate(direction)
    let idx = index(g:favorite_colors, g:theme)
    if a:direction == 0
        let idx = (idx + 1) % len(g:favorite_colors)
    else
        let idx = (idx - 1 % len(g:favorite_colors) + len(g:favorite_colors)) % len(g:favorite_colors)
    endif
    let g:theme = g:favorite_colors[idx]
    execute 'colorscheme ' . g:theme
    echo g:theme
endf

nnoremap <F3> :call CRotate(0)<CR>
nnoremap <F4> :call CRotate(1)<CR>

fun! s:BG()
    let &background = ( &background == "dark" ? "light" : "dark" )
    if exists("g:theme")
        exe "colorscheme " . g:theme
    endif
endf
command! BG call s:BG()
nnoremap <silent> <F5> :BG<CR>

"}}}

" AUTOCOMMANDS {{{
aug vimrc
au!
" Restore cursor position and other state from shada/viminfo
au BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Autoreload vimrc
au BufWritePost $MYVIMRC source $MYVIMRC | setlocal fdm=marker

" Normalize splits on resize
au VimResized * wincmd =

" Close Netrw when exiting
au FileType netrw setlocal bufhidden=delete

au BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Close preview window after completion
au CompleteDone * if pumvisible() == 0 | pclose | endif

" Highlight cursorline only in active window
au WinEnter * set cursorline
au WinLeave * set nocursorline

" Bind q to close help and quickfix windows
au FileType qf nnoremap <silent> <buffer> q :close<CR>
" au FileType help nnoremap <silent> <buffer> q :close<CR>
" If help is last window, delete buffer, else close window
au FileType help nnoremap <silent> <expr> <buffer> q winnr('$') == 1 ? ':bd<CR>' : ':close<CR>'
" Open help in a new tab
au FileType help wincmd T

" Use custom colorscheme for text files
au FileType text let b:textfile = 1
au BufEnter * call SetColors()

" Override formatoptions, which are set by ftplugins
au vimrc BufEnter * set formatoptions=jncrql

aug END
"}}}

" KEYBINDINGS {{{

" Leader
let g:mapleader=" "
nnoremap <M-x> :Commands<CR>
nnoremap <silent> <leader>q :qa!<CR>
nnoremap <silent> <leader>Q :qa!<CR>
nnoremap <silent> <leader>w :x!<CR>
nnoremap <silent> <leader>s :up<CR>
nnoremap <silent> <leader>e :e!<CR>
nnoremap <silent> <leader>v :e $MYVIMRC<CR>
nnoremap <silent> <leader>C :Directories<CR>
nnoremap <silent> <leader>n :enew<CR>
nnoremap <silent> <leader><Tab> :Buffers<CR>
nnoremap <silent> <C-R> :History:<CR>
nnoremap <silent> <leader>: :Commands<CR>
nnoremap <silent> <leader>h :Helptags<CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>F :Files ~<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>c :Colors<CR>
nnoremap <silent> <leader>' :Marks<CR>
nnoremap <leader>a :Ag<Space>
nnoremap <leader>o :Locate<Space>
" nnoremap <silent> <leader>r :History<CR>
" TODO: ':Vista finder' uses ctags even when coc is available (sometimes)
nnoremap <silent> <leader><leader> :Vista finder coc<CR>
nnoremap <silent> t :Tags<CR>
" nnoremap <silent> <leader>l :Lines<CR>
nnoremap <silent> S :Lines<CR>
nnoremap <silent> <M-l> :Lines<CR>
nnoremap <silent> <leader>ii :PlugInstall<CR>
nnoremap <silent> <leader>iu :PlugUpdate<CR>
nnoremap <silent> <leader>ic :PlugClean!<CR>

" Escape
noremap  <M-q> <Esc>
inoremap <M-q> <Esc>
inoremap <M-Q> <Esc>
cnoremap <M-q> <C-C>
inoremap <ScrollWheelUp> <Esc>
inoremap <ScrollWheelDown> <Esc>
inoremap <C-C> <Esc>

" No Ex-mode
nnoremap gQ <Nop>
nnoremap <M-Q> <Nop>

" Command mode
noremap Ã¸ :

" Repeat last command
noremap \ @:

" Moving around
noremap <silent> j gj
noremap <silent> k gk
noremap L $
noremap Ã¸ $
noremap } $
noremap H ^
nnoremap <silent> J :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap <silent> K :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>
xnoremap <silent> J :<C-u>keepjumps normal! gv}<CR>
xnoremap <silent> K :<C-u>keepjumps normal! gv{<CR>
onoremap J }
onoremap K {
nnoremap <M-j> 5gjzz
nnoremap <M-k> 5gkzz
nmap gj ]]
nmap gk [[
nnoremap <C-F> <C-F>zz
nnoremap <C-B> <C-B>zz
nnoremap <C-D> <C-D>zz
nnoremap <C-U> <C-U>zz
nnoremap G Gzz
map gb %
xnoremap <expr> j mode() ==# 'v' ? 'gj' : 'j'
xnoremap <expr> k mode() ==# 'v' ? 'gk' : 'k'

" Redo
nnoremap U <C-R>

" Chain undo
inoremap <M-u> <Esc>u
inoremap <M-U> <Esc><C-R>
nnoremap <M-u> u
nnoremap <M-U> <C-R>
xnoremap <M-u> <Esc>u
xnoremap <M-U> <Esc><C-R>

" Chain newline
inoremap <M-o> <Esc>o
inoremap <M-O> <Esc>O

" Command/insert mode
noremap! <M-BS> <C-W>
noremap! <C-F> <Right>
noremap! <C-B> <Left>
noremap! <C-D> <Del>

" Insert mode editing
inoremap <M-f> <Esc><C-Right>
inoremap <M-b> <Esc><C-Left>
nnoremap <M-f> <C-Right>
nnoremap <M-b> <C-Left>
inoremap <M-d> <C-\><C-O>de
nnoremap <M-d> dW
inoremap <M-i> <Esc>I
inoremap <M-a> <Esc>A
" TODO: finne noe bedre for change line fra insert mode og normal mode
" inoremap <C-Q> <Esc>S

" Insert mode completion
inoremap <M-n> <C-N>
inoremap <M-p> <C-P>
imap <C-L> <C-X><C-L>
imap <M-l> <C-X><C-L>
imap <M-w> <C-X><C-F>

" Command/search mode editing
cnoremap <M-f> <C-Right>
cnoremap <M-b> <C-Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <M-d> <C-Right><C-W>
cnoremap <M-n> <C-n>
cnoremap <M-p> <C-p>
cnoremap <M-u> <C-U>

" Go to next/prev search match while searching
cnoremap <M-j> <C-G>
cnoremap <M-k> <C-T>

" Command history from normal mode
nnoremap <M-.> :<Up>
cnoremap <M-.> <Up>
cnoremap <M-:> <Down>

" Searching
nnoremap s /
" nnoremap S ?
xnoremap s /
" xnoremap S ?
nnoremap <M-n> *
nnoremap <M-N> #
xnoremap <M-n> *
xnoremap <M-N> #

" Navigate changelist
noremap , g;zvzz
noremap ; g,zvzz

" Alternating
nnoremap <silent> <C-A> <C-^>
nnoremap q ``
nnoremap Q `.zz
xnoremap q o<Esc>
xnoremap <M-o> o<Esc>
nnoremap <BS> <C-W>p
nnoremap <M-BS> <C-W>c

" Windows and buffers
noremap <silent> <C-n> :bn<CR>
noremap <silent> <C-p> :bp<CR>
nnoremap <silent> <C-Q> :close<CR>
nnoremap <silent> <C-X> :bp<Bar>bd! #<CR>
nnoremap <silent> <C-H> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-J> :TmuxNavigateDown<CR>
nnoremap <silent> <C-K> :TmuxNavigateUp<CR>
nnoremap <silent> <C-L> :TmuxNavigateRight<CR>

" Save
nnoremap <silent> <C-S> :up<CR>
inoremap <silent> <C-s> <Esc>:up<CR>
nnoremap <silent> <M-s> :up<CR>
inoremap <silent> <M-s> <Esc>:up<CR>

" Quickfix
if executable('ag') | set grepprg=ag\ --vimgrep\ --silent | endif
command! -nargs=? -complete=file_in_path Grep silent grep! <args>
" nmap <silent> <leader>k :Grep "\b<cword>\b"<CR>
" nmap <silent> gw :Grep "\b<cword>\b"<CR>
nnoremap <silent> <left>  :cpf<CR>zvzz
nnoremap <silent> <right> :cnf<CR>zvzz
" nnoremap <silent> <up>    :cprev<CR>zvzz
" nnoremap <silent> <down>  :cnext<CR>zvzz
nmap <silent> co <Plug>(qf_qf_toggle)
aug QuickfixKeys
au!
au BufReadPost quickfix nnoremap <buffer> <CR> <CR>
au BufReadPost quickfix nnoremap <silent> <buffer> J :call qf#filegroup#NextFile()<CR>
au BufReadPost quickfix nnoremap <silent> <buffer> K :call qf#filegroup#PreviousFile()<CR>
aug END

" Diff mode
nnoremap <silent> <expr> <up>    &diff ? '[c' : ':cprev<CR>zvzz'
nnoremap <silent> <expr> <down>  &diff ? ']c' : ':cnext<CR>zvzz'
nnoremap <silent> <expr> <left>  &diff ? 'do' : ':cpf<CR>zvzz'
nnoremap <silent> <expr> <right> &diff ? 'dp' : ':cnf<CR>zvzz'
nnoremap <silent> <expr> dp &diff ? 'dp' : ':t.<CR>'
nnoremap <silent> <expr> do &diff ? 'do' : ':Explore<CR>'
nnoremap <silent> <expr> <leader>d &diff ? ':diffoff!<CR>:q<CR>' : ':Gdiffsplit<CR>'

" substsitute
nnoremap gs :%s/
xnoremap gs :s/
" replace word/visual
nnoremap gr :%s/\<<c-r><c-w>\>/
xnoremap gr y:%s/\<<c-r>"\>/
" remove empty lines
xnoremap R :g/^$/d<CR>
" make one empty line between each paragraph
" xnoremap Q :s/\n\{3,\}/\r\r<CR>
" Apply macro linewise
xnoremap <silent> Q :norm @q<cr>

" page up down
nnoremap <C-F> <C-F>zz
nnoremap <C-B> <C-B>zz
nmap đ <C-F>
nmap ” <C-B>

" go to tag
nnoremap <CR> <C-]>zz
nnoremap <M-g> <C-]>zz

" record macro
nnoremap <M-Q> q
" record toggle
let g:isRecording = get(g:, 'isRecording', 0)
nnoremap <expr> <silent> å g:isRecording ? 'q:let g:isRecording=0<CR>' : 'qq:let g:isRecording=1<CR>'
" play macro
nnoremap Å @q

" visual indent
xnoremap > >gv
xnoremap < <gv
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv
xnoremap <M-i> >gv
xnoremap <M-I> <gv

" normal indent
nnoremap <M-i> >>
nnoremap <M-I> <<

" autoindent
nnoremap g= gg=G``
nnoremap <M-a> mz=ap`z

" toggle comment
nmap <M-c> gcc
xmap <M-c> gc
nmap <M-C> :t-1<CR>gccj

" yank to end of line
map Y y$
"d/c/y to start of line
nnoremap dh d^
nnoremap ch c^
nnoremap yh y^

call yankstack#setup()
nmap <M-p> <Plug>yankstack_substitute_older_paste
nmap <M-P> <Plug>yankstack_substitute_newer_paste

" yank to clipboard
xnoremap <C-C> "+y
nnoremap <C-C> "+yy
" paste from clipboard
nnoremap <leader>p "+p
" nnoremap cp <esc>"+p
" nnoremap cP <esc>"+P
" paste from numreg
nnoremap cp "1p
nnoremap cP "1P
" paste from yank register
nnoremap yp "0p
nnoremap yP "0P
" paste unnamed reg in insert mode (use C-Q to insert literal)
inoremap <C-v> <C-R>"

" duplicate lines
nnoremap dP :t-1<CR>
nnoremap + :t-1<CR>
xnoremap P :t-1<CR>

" delete line
nnoremap <M-D> dd

" insert blank lines
fun! s:blankup(count) abort
    put!=repeat(nr2char(10), a:count)
    ']
endf

fun! s:blankdown(count) abort
    put =repeat(nr2char(10), a:count)
    '[
endf

nnoremap <silent> <M-o> :<c-u>call <SID>blankdown(v:count1)<CR>
nnoremap <silent> <M-O> :<c-u>call <SID>blankup(v:count1)<CR>

" move lines
nnoremap <silent> <C-M-j> mz:m+<CR>`z
nnoremap <silent> <C-M-k> mz:m-2<CR>`z
" TODO: autoindent
xnoremap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
xnoremap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

" Toggling panels
nnoremap <silent> <expr> <M-1> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
" nnoremap <silent> <M-2> :TagbarToggle<CR>
nnoremap <silent> <M-2> :Vista!!<CR>
nnoremap <silent> <M-3> :Vista!!<Bar>NERDTreeToggle<CR><C-W>p

nnoremap cd :Directories<CR>
nnoremap mv :Rename<Space>
nnoremap cu :<C-U>call ToggleWorkingDir()<CR>
nnoremap gB :ls!<CR>:b<Space>
nnoremap vm :Marks<CR>

nnoremap vv viw
nnoremap VV viW
nnoremap <m-v> ^vg_
nnoremap <m-y> ^y$
xnoremap <expr> I mode() == '<C-V>' ? 'I' : '<C-V>^I'
xnoremap <expr> A mode() == '<C-V>' ? 'A' : '<C-V>$A'

" Preview tag under cursor
nnoremap <C-W><C-I> <C-W>}

"{{{ Less useful keybindings
nnoremap M zz
nnoremap <C-E> zt
nnoremap <C-Y> zb
nnoremap g<Space> a<Space><Esc>
" nnoremap <m-s> a<Space><Esc>
" nnoremap <silent> <M-Bar> :call Scratch()<CR>
" noremap gh H
" noremap gl L
" noremap gm M
cmap w!! SudoWrite
nnoremap g/ :g//<CR>
" nnoremap cd /\d\+<CR>gnc
nnoremap vd /\d\+<CR>gn

"inc/decrement number
nnoremap ± <C-A>
nnoremap ¿ <C-X>

inoremap <M-CR> <ESC>:s/\s*;*\s*$/;<CR>j
nnoremap <M-CR> <ESC>:s/\s*;*\s*$/;<CR>j

nnoremap <M-n> *Ncgn
nnoremap gl ^yg_

"}}}
"}}}

" FOLDING {{{
setglobal fdm=indent
setglobal nofoldenable
set foldopen+=jump
" au vimrc BufEnter $MYVIMRC setlocal fdm=marker | norm zv
au vimrc BufEnter $MYVIMRC norm zv
au vimrc FileType vim setlocal fdm=marker | norm zv
" if expand("%:t") != 'init.vim'
"     set nofoldenable
" endif
" set foldlevel=2
" set foldnestmax=2
nnoremap <expr> <F1> &foldlevel ? 'zM' :'zR'
nnoremap <M-m> zm
nnoremap <M-M> zr
nnoremap <Bar> za
"}}}

" FUNCTIONS {{{
let g:highlight_trailing = 0
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
highlight clear ExtraWhitespace
fun! Highlight_trailing_whitespace()
    if g:highlight_trailing == 0
        let g:highlight_trailing = 1
        highlight ExtraWhitespace ctermbg=red guibg=red
        echom "Highlight trailing enabled"
    else
        let g:highlight_trailing = 0
        highlight clear ExtraWhitespace
        echom "Highlight trailing disabled"
    endif
endf
map <silent> <F2> :call Highlight_trailing_whitespace()<CR>

fun! Scratch()
    if bufnr('Scratch') == -1
        e Scratch
        setlocal filetype=text nobuflisted bufhidden=hide buftype=nofile noswapfile
        call SetColors()
    elseif bufnr('%') == bufnr('Scratch')
        b #
    else
        execute "b " . bufnr('Scratch')
    endif
endf

fun! JustOneSpace()
    s/\s\+/ /
    " normal ==
endf
nnoremap <silent> <M-Space> :call JustOneSpace()<CR>

command! -nargs=? Filter let @x='' | execute 'g/<args>/y X' | enew | setlocal bt=nofile | put! x

fun! Redir(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "No output"
  else
    enew | setlocal bt=nofile
    silent put=message
  endif
endf
command! -nargs=+ -complete=command Redir call Redir(<q-args>)

command! BufOnly silent! execute "up|%bd|e#|bd#"

fun! ToggleWorkingDir()
    if !exists("g:project_dir")
        let g:project_dir=getcwd()
        cd %:p:h
        pwd
    else
        execute "cd " . g:project_dir
        unlet g:project_dir
        pwd
    endif
endf

fun! StripTrailingWhitespace()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endf

" TODO: add appropriate shebang for language, chmod +x, save and run
" Separate command to shebang and make executable
" A file will not be run with right interpreter, even with .py extension,
" without shebang. Note: this should be used for files intended to be run as
" executable scripts, and has the advantage that it is filetype agnostic. However, many
" programs should not be executables, so there should be a different function
" for running a file with the right interpreter

" TODO: different commands/functions/keybinds
" - ensure shebang (from filetype), save file, ensure chmod +x, run file as a script
" - ensure chmod +x and run file as script IF it has a shebang (not every
"   shell type file is an executable), ELSE source the file (your shell must
"   be the same as the type of the file) OR apply interpreter to file (run it
"   in a subshell) (sourcing might make sense if it could update vim's parent
"   shell (reloading zshrc)) (subshelling the file might not make sense
"   compared to running it as a script)
" - save file, then either:
"   - compile the file and run the output executable
"   - run make and run the main output executable (or the one corresponding to
"   this file if there are several entrypoints to the program)
" - apply the right interpreter to the current file

" Run file as script (requires shebang and executable) with optional arguments
" TODO: fun RunScript()
command! -nargs=* R up|!%:p <args>

" Send selection to python interpreter
xnoremap <leader>r :w !python<CR>

fun! Run()
    if &ft =~ '\v(sh|bash|zsh)'
        " AND has a shebang 
        " call RunScript()
        R
    elseif &ft =~ 'vim'
        source %
    elseif &ft =~ '\v(python|ruby)'
        call RunInterpreter()
    elseif &ft =~ '\v(c|cpp)'
        call RunCompiler()
    else
        R
    endif
endf
nnoremap <leader>r :call Run()<CR>

fun! RunInterpreter()
    update
    let l:interpreter = trim(system('command -v ' . &ft))
    execute '!' . l:interpreter . ' ' . expand('%')
endf
" :up<CR>:!python %<CR>

fun! RunCompiler()
    update
    !gcc -g % -o %< && ./%<
endf

" Save, compile with gcc, and run binary
map <F12> :up<CR>:!gcc -g % -o %< && ./%< <CR>

inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" Copy a register to the clipboard
command! -nargs=1 Clip let @+=@<args>

" Paste whatever is in the clipboard as a new line
fun! PutLine()
    let @+ = substitute(@+, '\n*$', '\n', 'g')
    normal "+p
    normal ==
endf
command! -nargs=0 PutLine call PutLine()
nnoremap <leader>p :PutLine<CR>

"}}}

" SANDWICH {{{
let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1

call operator#sandwich#set('delete', 'all', 'highlight', 0)
highlight link OperatorSandwichChange IncSearch

nmap <M-r> <Plug>(operator-sandwich-add)
xmap <M-r> <Plug>(operator-sandwich-add)
nmap ds <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap dss <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap cs <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap css <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

onoremap <silent> <SID>line :normal! ^vg_<CR>

nmap <M-w> <M-r>iw
nmap <M-W> <M-r>iW
nmap <M-R> <M-r>g_
imap <M-R> <Esc>l<M-r>g_
nmap <M-r><M-r> <M-r><SID>line

let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
            \ {'buns': ['<', '>'], 'expand_range': 0, 'match_syntax': 1, 'input': ['a']},
            \ {'buns': ['"', '"'], 'quoteescape': 1, 'expand_range': 0, 'linewise': 0, 'nesting': 0, 'input': ['d']},
            \ {'buns': ['''', ''''], 'quoteescape': 1, 'expand_range': 0, 'linewise': 0, 'nesting': 0, 'input': ['q']},
            \ {'buns': ['{', '}'], 'skip_break': 1, 'match_syntax': 1, 'nesting': 1, 'input': ['B']},
            \ {'buns': ['[', ']'], 'match_syntax': 1, 'nesting': 1, 'input': ['r']},
            \ {'buns': ['(', ')'], 'match_syntax': 1, 'nesting': 1, 'input': ['b']},
            \]
"}}}

" FZF {{{
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_nvim_statusline = 0
let g:fzf_buffers_jump = 1
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Disable statusline
au! FileType fzf
au  FileType fzf set laststatus=0 noshowmode noruler
            \| au BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_colors =
          \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Statement'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'Normal'],
            \ 'hl+':     ['fg', 'SpecialComment'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=* Ag call fzf#vim#ag
            \ (<q-args>, '--color-path "0;34" --color-line-number "0;32"', fzf#vim#with_preview(), <bang>0)

" Files with bat previewer
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, {'options': ['--preview', 'bat -p --color always {}']}, <bang>0)

" Buffers with --select-1
command! -bang -nargs=? -complete=buffer Buffers
            \ call fzf#vim#buffers(<q-args>, {'options': ['-1']}, <bang>0)

" cd under $HOME
command! -nargs=* -complete=dir Directories call fzf#run(fzf#wrap(
            \ {'source': 'fd . -H -td ~',
            \  'sink': 'cd'}))

imap <C-X><C-F> <plug>(fzf-complete-path)
imap <C-X><C-L> <plug>(fzf-complete-line)
nmap <leader>? <plug>(fzf-maps-n)
xmap <leader>? <plug>(fzf-maps-x)
omap <leader>? <plug>(fzf-maps-o)
imap <c-x>? <plug>(fzf-maps-i)

"}}}

" Netrw {{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
"}}}

" COC TESTING {{{

" Compare: ALENext, ALEDetail
" diagnostic.displayByAle": true,
" <Plug>(coc-diagnostic-info)
" <Plug>(coc-diagnostic-next)
" <Plug>(coc-diagnostic-prev)
" <Plug>(coc-diagnostic-next-error)
" <Plug>(coc-diagnostic-prev-error)

" Compare: ALEGoToDefinition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" <Plug>(coc-declaration)
" <Plug>(coc-references)

" nmap <m-cr>  <Plug>(coc-codeaction)
nmap <c-space> <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" nnoremap <F5> :Format<CR>
" <Plug>(coc-format)

nnoremap <silent> <leader>ll  :<C-u>CocList<CR>
nnoremap <silent> <leader>lc  :<C-u>CocCommand<CR>
nnoremap <silent> <leader>lo  :<C-u>CocList outline<CR>
nnoremap <silent> <leader>ls  :<C-u>CocList -I symbols<CR>
nnoremap <silent> <leader>ld  :<C-u>CocList diagnostics<CR>

nnoremap cr <Plug>(coc-rename)
nnoremap vr <Plug>(coc-refactor)
"}}}

" TESTING AREA {{{

" FREE KEYS {{{

" nnoremap <C-<>
" nnoremap <C-E>
" nnoremap <C-E>
" nnoremap <C-Y>
" nnoremap <M-0>
" nnoremap <M-S>
" nnoremap <M-Z>

" inoremap <C-H>
" inoremap <C-J>

" nnoremap +
" nnoremap -
" nnoremap \
" nnoremap ^ 
" nnoremap _
" nnoremap |
" nnoremap }
" nnoremap ¨ 
" nnoremap cd
" nnoremap cm
" nnoremap co
" nnoremap cq
" nnoremap cr
" nnoremap cu
" nnoremap cv
" nnoremap cx
" nnoremap cy
" nnoremap cz
" nnoremap dc
" nnoremap dm
" nnoremap do
" nnoremap dp
" nnoremap dq
" nnoremap dr
" nnoremap du

" nnoremap dv diw
" nmap dv dgn
nmap dv dav
nmap cv civ

" nnoremap dx
" nnoremap dy
" nnoremap dz
" nnoremap gH
" nnoremap gI
" nnoremap gm
" nnoremap go
" nnoremap gt
" nnoremap gV
" nnoremap gw
" nnoremap gz
" nnoremap M
" nnoremap mv
" nnoremap vc
" nnoremap vd
" nnoremap vm
" nnoremap vo
nnoremap vp yapP
" nnoremap vq
" nnoremap vr
" nnoremap vx
" nnoremap vy
" nnoremap yc
" nnoremap yd
" nnoremap ym
" nnoremap yo
" nnoremap yp
" nnoremap yq
" nnoremap yr
" nnoremap yu
" nnoremap yv
" nnoremap yx
" nnoremap yz
" nnoremap Z
" nnoremap zd
" nnoremap zp
" nnoremap zs
" nnoremap zx :pclose<CR>

"}}}


" Zappend/Zelect
" nnoremap zd "Zdd
" nnoremap zp "zp:let @z=''<CR>

" Fetch lines
" nnoremap + :<C-u>+m.<left><left>
" nnoremap - :<C-u>-m.<left><left>

inoremap <M-2> @
inoremap <M-3> #
inoremap <M-4> $
inoremap <M-5> %


" Does not use tags, only finds files in same directory, does not check if
" file exists
" Edit: chooses c or cpp globally per session
function Header()
    let l:ext = expand('%:e') 
    if &filetype =~ "c|cpp"
        let g:c_ext = &filetype
    endif
    if l:ext == g:c_ext
        if filereadable(expand('%:r') . '.h')
            :e %:r.h
        else
            echo "No corresponding header"
        endif
    elseif l:ext == 'h'
        if filereadable(expand('%:r') . '.' . g:c_ext)
            execute ":e %:r." . g:c_ext
        else
            echo "No corresponding source"
        endif
    else
        echo "Not a c, cpp or h file"
    endif
endf
command! Header call Header()
nnoremap <silent> gh :Header<CR>

" TODO: make new tab if error
nnoremap <silent> <leader>1 :1tabnext<CR>
nnoremap <silent> <leader>2 :2tabnext<CR>
nnoremap <silent> <leader>3 :3tabnext<CR>
nnoremap <silent> <leader>4 :4tabnext<CR>

" if winnr('$') == 1
"   " only one window
"   " make expression mapping to bd when last window in help buffer
" endif


noremap <m-e> g_
nnoremap <m-E> vg_
xnoremap x "_x
nnoremap <m-w> ciW
xnoremap + <C-A>gv
xnoremap - <C-X>gv
xmap <silent> <C-A> <C-A>/\d\+<CR>Ngn
xmap <silent> <C-X> <C-X>/\d\+<CR>Ngn
nnoremap <m-l> cc
nnoremap <silent> <M-Space> i<space><right><space><esc>mz:call JustOneSpace()<CR>`z
nnoremap <c-e> :Snippets<CR>

"}}}

