set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim

syntax enable




set backspace=indent,eol,start              "Make backspace behave like every other editor.
let mapleader =','                    "The default leader is \, but a comma is much better.
set nonumber                                                    "Let's activate line numbers.
set linespace=15                                              "Macvim-specific line-height.
set mouse-=a
set showtabline=2
set noerrorbells visualbell t_vb=                       "No damn bells!
set autowriteall                       "Automatically write the file when switching buffers
set complete=.,w,b,u                   "Set our desired autocompletion matching

"-------------Visuals-------------
colorscheme atom-dark-256
"set t_Co=256

set guifont=Hack

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R


"We'll fake a custom left padding for each windows.
hi LineNr guibg=bg
set foldcolumn=1
hi foldcolum guibg=bg


"-------------Search-------------
set hlsearch
set incsearch



"-------------Search-------------
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>



"-------------Mappings-------------

"make it easy to edit the Vimrc file.
nmap <leader>ev :tabedit $MYVIMRC<cr>
nmap <leader>ep :e ~/.vim/plugins.vim<cr>
nmap <leader>es :e ~/.vim/snippets/


"Add simple highlight removal.
nmap <leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle.
nmap <leader>1 :NERDTreeToggle<cr>

nmap <c-R> :CtrlPBufTag<cr>
nmap <leader>u :CtrlPMRUFiles<cr>

nmap <leader>f :tag<space>

"-------------Plugins-------------

"/ CtrlP
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:15'

"/ NERDTree
let NERDTreeHijackNetrw = 0

"/ Greplace
set grepprg=ag                      "We want to use Ag for the search.

let g:grep_cmd_opts = '--line-numbers --noheading'


"-------------Laravel-Specific------------
nmap <leader>lr :e app/Http/routes.php<cr>
nmap <leader>lnr :e routes/web.php<cr>
nmap <leader>lm :!php artisan make:
nmap <leader><leader>c :e app/Http/controllers/<cr>
nmap <leader><leader>m :CtrlP<cr>app/
nmap <leader><leader>v :e resources/views/<cr>


"-------------Auto-Commands-------------

"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END


"php.vim
function! PhpSyntaxOverride()
	hi! def link phpDocTags  phpDefine
	hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
	autocmd!
	autocmd FileType php call PhpSyntaxOverride()
augroup END

"vim php namespace
function! IPhpInsertUse()
	call PhpInsertUse()
	call feedkeys('a', 'n')
endfunction

autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>
