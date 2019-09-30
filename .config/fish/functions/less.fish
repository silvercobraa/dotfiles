function less --description 'less con colores' --wraps less
	env less --raw-control-chars $argv
end
