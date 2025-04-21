extends Control

@onready var username_textedit = $Usuario
@onready var password_textedit = $"Contraseña"
@onready var status_label = $result_label
var users = {"usuario1": "contraseña1", "usuario2": "contraseña2"}

func _on_volver_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/menu.tscn")

func _on_iniciar_sesion_pressed() -> void:
	_on_login_pressed()

func _on_login_pressed() :
	var username = username_textedit.text.strip_edges()
	var password = password_textedit.text.strip_edges()

	if username == "" or password == "":
		status_label.text = "faltan datos"
	elif users.has(username) and users[username] == password:
		status_label.text = "Inicio de sesión exitoso"
		UsuarioMenu.usuario_actual = username  # ← Guarda el usuario
		get_tree().change_scene_to_file("res://Escenas/menu.tscn")  # Cambia de escena
	else:
		status_label.text = "Usuario o contraseña incorrectos"
