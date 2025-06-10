extends Node
var usuario_actual = ""

		
func _unhandled_input(event):
	if event.is_action_pressed("cambiar_visualizacion"):
		var current_mode = DisplayServer.window_get_mode()
		print("Modo actual:", current_mode)
		if current_mode == DisplayServer.WINDOW_MODE_WINDOWED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
