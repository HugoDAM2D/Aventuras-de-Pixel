extends Control

func resumen():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("pausa") # Reproduce hacia atrás para salir de la pausa

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("pausa") # Reproduce hacia adelante para entrar en la pausa
	
func testEsc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resumen()

func _on_resumen_pressed() -> void:
	resumen()

func _on_reiniciar_pressed() -> void:
	get_tree().reload_current_scene()

func _on_salir_pressed() -> void:
	resumen()
	get_tree().change_scene_to_file("res://escenas/selectorNivel/selectorNivel.tscn")

func _process(delta: float) -> void:
	testEsc()
