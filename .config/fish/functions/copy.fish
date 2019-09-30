function copy --description 'copia lo que le pasen por stdin' --wraps xclip
	env xclip -selection clipboard $argv
end
