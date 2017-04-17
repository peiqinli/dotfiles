" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Base16 for Vim
Plug 'chriskempson/base16-vim'

" Fuzzy file, buffer, mru, tag, etc finder
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
let g:ctrlp_map = '<c-p>' 
let g:ctrlp_cmd = 'CtrlP'
" 设置过滤不进行查找的后缀名
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$' 

" A code-completion engine for Vim
Plug 'https://github.com/Valloric/YouCompleteMe.git'
" 设置跳转到方法/函数定义的快捷键 
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR> 
" 触发补全快捷键 
let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>'] 
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>'] 
let g:ycm_auto_trigger = 1 
" 最小自动触发补全的字符大小设置为 3 
let g:ycm_min_num_of_chars_for_completion = 3 

" Vim plugin for intensely orgasmic commenting
Plug 'https://github.com/scrooloose/nerdcommenter.git'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()
