extends Node

@onready var db := SQLite.new()
var db_path = "user://mi_base_de_datos.sqlite"

var puntuacion = 0
var tiempo := 0

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
	mandarDatos(username,segundos_totales)
	
func mandarDatos(username: String, segundos: int ):
	db.path = db_path
	db.open_db()

	# Verificar si ya existe
	# INSERT INTO Nivel (nombre, descripcion, dificultad)
	#	VALUES ("Primer nivel", "Nivel donde empiezas las primeras aventuras de pixel", 1);
	var check_query = "SELECT id FROM Usuario WHERE username = '%s';" % username
	db.query(check_query)
	print(db.query_result)
	print(db.query_result[0])
	var userId = int(db.query_result[0]["id"])
	
	# Insertar nuevo usuario
	var insert_query = "INSERT INTO Puntuacion (usuario_id, nivel_id, puntuacion, tiempo_segundos)
	 VALUES ('%s', '%s','%s','%s');" % [userId,1,puntuacion,segundos]
	db.query(insert_query)
