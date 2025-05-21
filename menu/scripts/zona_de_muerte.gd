extends Area2D
@onready var game_manager = get_node("/root/Escena01_lvl1/GameManager")
@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _on_body_entered(body: Node2D) -> void:
	#get_tree().change_scene_to_file("res://escenas/Menu/menu.tscn")
	#Velocidad del tiempo
	Engine.time_scale = 0.5
	audio_stream_player_2d.play()
	game_manager.enviar_tiempo()
	body.get_node("CollisionShape2D").queue_free()
	timer.start()


func _on_timer_timeout() -> void:
	# Velocidad por defecto
	Engine.time_scale = 1
	get_tree().reload_current_scene()
