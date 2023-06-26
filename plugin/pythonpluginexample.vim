command! ComandoMuestra :py3 MiPluginFuncion()
execute 'python3 << EOF'
print('holis perrote')
import vim, os, sys

from testlibrs.Executions import *

hello_world()

EOF

