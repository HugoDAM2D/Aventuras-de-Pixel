extends Control

@onready var username_textedit = $Usuario
@onready var password_textedit = $"Contraseña"
@onready var status_label = $result_label
@onready var db := SQLite.new()
var db_path = "user://mi_base_de_datos.sqlite"

func _on_volver_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/menu.tscn")

func _on_iniciar_sesion_pressed() -> void:
	_on_login_pressed()

func _on_registrarse_pressed() -> void:
	var username = username_textedit.text.strip_edges()
	var password = password_textedit.text.strip_edges()
	crear_usuario(username, password)
	


func _on_login_pressed() :
	var username = username_textedit.text.strip_edges()
	var password = password_textedit.text.strip_edges()

	if username == "" or password == "":
		status_label.text = "faltan datos"
	elif verificar_usuario(username,password):
		status_label.text = "Inicio de sesión exitoso"
		UsuarioMenu.usuario_actual = username  # ← Guarda el usuario
		get_tree().change_scene_to_file("res://Escenas/menu.tscn")  # Cambia de escena
	else:
		status_label.text = "Usuario o contraseña incorrectos"

func verificar_usuario(username: String, password: String) -> bool:
	var query = "SELECT * FROM Usuario WHERE username = '%s' AND password = '%s';" % [username, password]
	db.path = db_path
	db.open_db()
	db.query(query)

	if db.query_result.size() > 0:
		db.close_db()
		return true
	else:
		db.close_db()
		return false




func crear_usuario(username: String, password: String) -> bool:
	db.path = db_path
	db.open_db()
	# Verificar si ya existe
	var check_query = "SELECT * FROM Usuario WHERE username = '%s';" % username
	db.query(check_query)

	if db.query_result.size() > 0:
		status_label.text = "El usuario ya existe."
		db.close_db()
		return false

	# Insertar nuevo usuario
	var insert_query = "INSERT INTO Usuario (username, password) VALUES ('%s', '%s');" % [username, password]
	db.query(insert_query)

	if db.query_result != null:
		status_label.text = "Usuario creado con éxito."
		db.close_db()
		return true
	else:
		status_label.text = "Error al crear usuario."
		db.close_db()
		return false
