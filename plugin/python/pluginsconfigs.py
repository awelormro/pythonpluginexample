import vim

def function_test():
    print('arriba el Toluca')


def fzf_launch_example():
    print('Aupa atleti')
    vim.command("execute ':Files'")

vim.command('command! FZFfrompython python3 pluginsconfigs.fzf_launch_example()')

vim.command('command! Pyfunctest python3 function_test()')



# Función que se ejecutará cuando se llame al comando
def mi_funcion(arg):
    print('Has seleccionado:', arg)

# Función que devuelve las opciones disponibles para el completado personalizado
def mi_completado(findstart, base):
    # Definir las opciones de argumentos para el comando
    opciones = ['opcion1', 'opcion2', 'opcion3']
    if int(findstart) == 1:
        # Devuelve la posición del primer carácter del comando
        return vim.current.window.cursor[1] - 1
    else:
        # Devuelve la lista de opciones que coinciden con el texto ingresado
        return [option for option in opciones if option.startswith(base)]

# Definir el comando en Vim con el completado personalizado
vim.command('command! -nargs=* -complete=customlist,mi_completado MiComando python3 pluginsconfigs.mi_funcion(<f-args>)')
