" vim: set fdm=marker:

" Detect if python3 is enabled {{{1
if !has('python3')
  echo 'Vim must be compiled with +python3 feature'
  finish
endif

" Detect if plugin has been called properly {{{1

if exists('g:pluginexamplepy_loaded')
  finish
endif


let s:plugexamplepath = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Start the plugin {{{1

python3 << EOF

# Libraries to import {{{2
import sys
from os.path import normpath, join
import vim

# Load python files {{{2
plugin_root_dir = vim.eval('s:plugexamplepath')
python_root_dir = normpath(join(plugin_root_dir, 'python'))
print(python_root_dir)
sys.path.insert(0, python_root_dir)


import pluginsconfigs

# }}}

EOF

" Function example {{{1

" fun! Examplepyfunction()
"   python3 pluginsconfigs.function_test()
" endf
" Second function example using python {{{1

function! CompleteFormat2(A, L, P)
  if !exists("s:formats")
    let s:opciones = ['opcion1', 'opcion2', 'opcion3']
  endif
  return filter(s:opciones, 'v:val =~ "^" . a:A')
endfunction

command! -nargs=* -complete=customlist,CompleteFormat2 MiComando2 python3 pluginsconfigs.mi_funcion(<q-args>)



" Examples of single line functions. {{{1

let g:pendejada1="echo 1"
let g:pendejada2="echo 3"
let g:pendejada3="echo 4"

exe "function Pendejada()\necho 'perras mamadas con el vim'|echo 22|call system('neofetch')\nendfunction"
exe "func Bar()\necho 1\nendfunc"
exe "func Foo()\necho 'foo'\nendfunc"

exe "function Suma(num1, num2) \n  echo num1 + num2 \n endfunction"

" }}}
