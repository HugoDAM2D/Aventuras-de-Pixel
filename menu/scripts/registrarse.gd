extends Button


@onready var username_textedit: TextEdit = %InicioUsuario
@onready var password_textedit: TextEdit = %InicioContraseña
@onready var status_label: Label = %result_label
@onready var db := SQLite.new()
var db_path = "user://mi_base_de_datos.sqlite"

func _on_pressed() -> void:
	var username = username_textedit.text.strip_edges()
	var password = password_textedit.text.strip_edges()
	if crear_usuario(username, password) == true:
		UsuarioMenu.usuario_actual = username
		get_tree().change_scene_to_file("res://escenas/Menu/menu.tscn")
	
	

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
