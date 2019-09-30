function fish_prompt --description 'Write out the prompt'
	#Save the return status of the previous command
    set stat $status

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end
    if not set -q __fish_color_blue
        set -g __fish_color_blue (set_color -o blue)
    end
    if not set -q __fish_color_red
        set -g __fish_color_red (set_color -o red)
    end
    if not set -q __fish_color_green
        set -g __fish_color_green (set_color -o green)
    end
    if not set -q __fish_color_yellow
        set -g __fish_color_yellow (set_color -o yellow)
    end

	if test (git rev-parse --is-inside-work-tree ^ /dev/null)
    	set -g rama_git (git rev-parse --abbrev-ref HEAD ^ /dev/null)
	else
    	set -g rama_git "-"
	end

    #Set the color for the status depending on the value
    set __fish_color_status (set_color -o green)
    if test $stat -gt 0
        set __fish_color_status (set_color -o red)
    end

	set carita "owo ❤"

	set ruta_relativa (echo $PWD | string replace $HOME '~')

	if test $stat -gt 0
		set carita "uwu ♡"
	end
	if test (string length $ruta_relativa) -gt 45
		set ruta "..."(string sub -s (math (string length $ruta_relativa) - 35) $PWD)
	else
		set ruta $ruta_relativa
	end

    switch "$USER"

        case root toor

            if not set -q __fish_prompt_cwd
                if set -q fish_color_cwd_root
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
                else
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd)
                end
            end

            printf '%s@%s %s%s%s# ' $USER (prompt_hostname) "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal"

        case '*'

            if not set -q __fish_prompt_cwd
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end

            #printf '[%s] %s%s@%s %s%s %s(%s)%s \f\r%s ' (date "+%H:%M:%S") "$__fish_color_blue" $USER (prompt_hostname) "$__fish_prompt_cwd" $ruta "$__fish_color_status" "$stat" "$__fish_prompt_normal" $carita
            printf '%s<%s> %s[%s] %s%s %s(%s)%s\f\r%s ' "$__fish_color_yellow" $USER "$__fish_color_blue" $ruta $__fish_color_green $rama_git "$__fish_color_status" "$stat" "$__fish_prompt_normal" $carita

    end
end
