extends Control

func _ready():
	$Usuario.text = UsuarioMenu.usuario_actual


func _on_jugar_pressed() -> void:
	pass # Replace with function body.


func _on_opciones_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/opciones.tscn")

func _on_salir_pressed() -> void:
	get_tree().quit()

func _on_inicio_sesion_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/inicioSesion.tscn")
