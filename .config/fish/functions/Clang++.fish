function Clang++ --description 'clang Weverything c++11 Wnoc++98compat' --wraps clang++
	clang++ -std=c++11 -Wno-c++98-compat -Weverything $argv
end
