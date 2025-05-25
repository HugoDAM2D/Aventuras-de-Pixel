extends Node

@onready var db := SQLite.new()
var db_path = "user://mi_base_de_datos.sqlite"

var puntuacion = 0
var tiempo := 0
var finalizadoN = 0
var finalizadoS = 1

func  _ready() -> void:
	empezar_tiempo()
	print("Se ha empezado el tiempo")

func incrementa_puntuacion():
	puntuacion += 1
	print(puntuacion)

func empezar_tiempo():
	tiempo += Time.get_ticks_msec()

func enviar_tiempo():
	var segundos_totales = int( Time.get_ticks_msec() - tiempo) / 1000.0
	var username = 	UsuarioMenu.usuario_actual
	mandarDatosMuerte(username,segundos_totales)
	
func enviar_tiempo_final():
	var segundos_totales = int( Time.get_ticks_msec() - tiempo) / 1000.0
	var username = 	UsuarioMenu.usuario_actual
	mandarDatosVictoria(username,segundos_totales)
	
func mandarDatosMuerte(username: String, segundos: int ):
	db.path = db_path
	db.open_db()

	var check_query = "SELECT id FROM Usuario WHERE username = '%s';" % username
	db.query(check_query)
	print(db.query_result)
	print(db.query_result[0])
	var userId = int(db.query_result[0]["id"])
	
	# Insertar nuevo usuario
	var insert_query = "INSERT INTO Puntuacion (usuario_id, nivel_id, puntuacion, tiempo_segundos,finalizado)
	 VALUES ('%s', '%s','%s','%s','%s');" % [userId,1,puntuacion,segundos,finalizadoN]
	db.query(insert_query)
	
func mandarDatosVictoria(username: String, segundos: int ):
	db.path = db_path
	db.open_db()

	var check_query = "SELECT id FROM Usuario WHERE username = '%s';" % username
	db.query(check_query)
	print(db.query_result)
	print(db.query_result[0])
	var userId = int(db.query_result[0]["id"])
	
	# Insertar nuevo usuario
	var insert_query = "INSERT INTO Puntuacion (usuario_id, nivel_id, puntuacion, tiempo_segundos,finalizado)
	 VALUES ('%s', '%s','%s','%s','%s');" % [userId,1,puntuacion,segundos,finalizadoS]
	db.query(insert_query)
