extends Button
@onready var username_textedit: TextEdit = %Usuario
@onready var password_textedit: TextEdit = %Contraseña
@onready var status_label: Label = %result_label
@onready var db := SQLite.new()
var db_path = "user://mi_base_de_datos.sqlite"

func _on_pressed() -> void:
	var username = username_textedit.text.strip_edges()
	var password = password_textedit.text.strip_edges()
	if username == "" or password == "":
		status_label.text = "faltan datos"
	elif verificar_usuario(username,password):
		status_label.text = "Inicio de sesión exitoso"
		UsuarioMenu.usuario_actual = username  # ← Guarda el usuario
		get_tree().change_scene_to_file("res://escenas/Menu/menu.tscn")  # Cambia de escena
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
