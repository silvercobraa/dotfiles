#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

alias ls='ls --color=auto'
alias ll='ls -l'
alias grep='grep --colour=auto'
alias shutup='xset b off' # esta wea hace que se calle el maldito beep
alias m3n='man' # wena tula m3n
alias gccbrigido='gcc -Werror -Wall -Wextra -pedantic-errors -Wcast-align -Wcast-qual -Wdisabled-optimization -Wformat=2 -Winit-self -Wlogical-op -Wmissing-include-dirs -Wredundant-decls -Wshadow -Wstrict-overflow=5'
alias clangbrigido='clang -Weverything -Werror'

# hoy me entere que update-grub simplemente llama a este comando
#alias update-grub='grub-mkconfig -o /boot/grub/grub.cfg'

# No entiendo cual es la diferencia en ponerle el signo dolar antes a las
# strings, ni tampoco se cuando usar comillas simples o dobles, pero por ahora
# funciona
#
# El \033 creo que es por razones de compatibilidad,
# el 01 es para que este en negrita,
# y el 3Xm es para el color de la fuente, con X un número de 0 al 7
# Tambien se puede usar 4X para ponerle color al fondo, pero la verdad se ve
# re feo
ROJO=$'\033[01;31m'
VERDE=$'\033[01;32m'
AMARILLO=$'\033[01;33m'
AZUL=$'\033[01;34m'
MAGENTA=$'\033[01;35m'
CIAN=$'\033[01;36m'
SINCOLOR=$'\033[0m'

BLANCO_FONDO_AZUL=$'\e[01;44;37m'

# Esta función imprime una carita feliz si el último comando retornó cero. En
# otro caso, imprime una carita triste.
carita() {
    # $? significa el valor de retorno del último comando en foreground
    RETORNO=$?
    if [[ ${RETORNO} == 0 ]]; then
        echo ${VERDE}':)'${SINCOLOR}
    else
        echo ${ROJO}':('${SINCOLOR}
    fi
    # -e es para que se escapen los backslash usando comillas simples, o bien
    # usar comillas dobles
    # [[ ${RC} == 0 ]] && echo ':)' || echo ':('
    # [[ ${RC} == 0 ]] && echo '(^ω^*)' || echo '(⇀‸↼‶)'
}


# Esta wea le pone colorcitos a las man pages (supuestamente...)
# 1) Versión copy-pasteada:
# # man() {
#     env \
#     LESS_TERMCAP_mb=$'\e[01;31m' \
#     LESS_TERMCAP_md=$'\e[01;36m' \
#     LESS_TERMCAP_me=$'\e[0m' \
#     LESS_TERMCAP_se=$'\e[0m' \
#     LESS_TERMCAP_so=$'\e[01;44;37m' \
#     LESS_TERMCAP_ue=$'\e[0m' \
#     LESS_TERMCAP_us=$'\e[01;34m' \
#     man "$@"
# }
# OJO! No se pueden colocar comentarios en la función de arriba, pasan cosas
# raras...
#
# 2) Versión modificada:
man() {
    env \
    LESS_TERMCAP_mb=${ROJO} \
    LESS_TERMCAP_md=${CIAN} \
    LESS_TERMCAP_me=${SINCOLOR} \
    LESS_TERMCAP_se=${SINCOLOR} \
    LESS_TERMCAP_so=${BLANCO_FONDO_AZUL} \
    LESS_TERMCAP_ue=${SINCOLOR} \
    LESS_TERMCAP_us=${AZUL} \
    man "$@"
}


# Esta es la prompt por defecto de antergos
# PS1='[\u@\h \W]\$ '

# Esta es mi prompt actual (2 líneas):
# silvercobraa@Lenovo-G400 :)
# ~ $
# PS1='${debian_chroot:+($debian_chroot)}\[${CIAN}\]\u\[${AZUL}\]@\h $(carita)\n\[${AZUL}\]\w \$\[${SINCOLOR}\] '
PS1='${debian_chroot:+($debian_chroot)}\
\[${AZUL}\][ \h ] \
\[${CIAN}\]\u \
\[$(carita)\]\
\n\
\[${AZUL}\]\w \
\$\[${SINCOLOR}\] '
# 2016-08-24: OJO CON LOS \[ \]  !!!
# hay que colocarlos encerrando a cada color, de lo contrario pasan cosas raras

# Versión windows xD
# echo -e 'Microsoft Windows [Version 10.0.10240]\n(c) 2015 Microsoft Windows Corporation. All rights reserved.\n'
# PS1='C:\\WINDOWS\\system32>'
# odio este lenguage de mierda

# >>>>BEGIN ADDED BY CNCHI INSTALLER<<<< #
BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/vim
