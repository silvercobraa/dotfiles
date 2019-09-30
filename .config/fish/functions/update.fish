function update --description 'Ejecuta un pacman update' --wraps sudo
	sudo pacman -Syyu
end
