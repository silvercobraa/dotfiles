function battery --description 'imprime el porcentaje de bateria restante' --wraps ip
	cat /sys/class/power_supply/BAT1/status /sys/class/power_supply/BAT1/capacity
end
