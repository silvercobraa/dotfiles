function g11 --description 'gcc C11 standard' --wraps gcc
	gcc -std=c11 $argv
end
