extends Node

var puntuacion = 0
var tiempo := 0
var tiempoTotal :=0
func incrementa_puntuacion():
	puntuacion += 1
	print(puntuacion)

func empezar_tiempo():
	tiempo += Time.get_ticks_msec()

func enviar_tiempo():
	var segundos_totales = int( Time.get_ticks_msec() - tiempo) / 1000.0
	var horas = segundos_totales / 3600
	var minutos = (segundos_totales % 3600) / 60
	var segundos = segundos_totales % 60
	var tiempo_formateado = "%02d:%02d:%02d" % [horas, minutos, segundos]
	
