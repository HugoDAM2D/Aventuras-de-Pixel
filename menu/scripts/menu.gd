extends Control
@onready var usuario: Label = %Usuario
@onready var result_label: Label = %result_label

func _ready():
	$Usuario.text = UsuarioMenu.usuario_actual


func _on_jugar_pressed() -> void:
	if usuario.text != "":
		get_tree().change_scene_to_file("res://escenas/selectorNivel/selectorNivel.tscn") # Replace with function body.
	else:
		result_label.text = "No se ha iniciado sesion"

func _on_opciones_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/Menu/opciones.tscn")

func _on_salir_pressed() -> void:
	get_tree().quit()

func _on_inicio_sesion_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/Menu/inicioSesion.tscn")
