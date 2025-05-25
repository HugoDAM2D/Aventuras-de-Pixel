extends Button

@onready var db := SQLite.new()
var db_path = "user://mi_base_de_datos.sqlite"
var username = 	UsuarioMenu.usuario_actual
@onready var accept_dialog: AcceptDialog = $"../AcceptDialog"

func _on_pressed() -> void:
	mostrarDatos()

func mostrarDatos():
	db.path = db_path
	db.open_db()

	var check_query = "SELECT 
	Usuario.username,
	Puntuacion.nivel_id,
	Puntuacion.puntuacion,
	Puntuacion.tiempo_segundos,
	Puntuacion.finalizado
	FROM Puntuacion
	JOIN Usuario ON Puntuacion.usuario_id = Usuario.id
	ORDER BY 
	Puntuacion.finalizado DESC,
	Puntuacion.puntuacion DESC,
	Puntuacion.tiempo_segundos DESC
	LIMIT 10;"
	db.query(check_query)
	
	var resultados = db.query_result
	var texto = "Ranking:\n\n"
	for fila in resultados:
			texto += "Usuario: %s | Nivel: %s | Puntos: %s | Tiempo: %s seg | %s\n" % [
		fila["username"],
		str(fila["nivel_id"]),
		str(fila["puntuacion"]),
		str(fila["tiempo_segundos"]),
		"✔" if fila["finalizado"] else "✘"]

	accept_dialog.dialog_text = texto
	accept_dialog.popup_centered()
	
	
