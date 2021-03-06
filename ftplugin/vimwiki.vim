"" (Most of this copy-pasted from ftplugin/markdown.vim, consider sourcing!)
setlocal spell spelllang=en_gb

"" the future is wrapping!
set wrap
set tw=0
set linebreak

"" 4-space indentation specially for code blocks
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

"" use web dictionary for lookups
call ref#register_detection('vimwiki', 'webdict')
