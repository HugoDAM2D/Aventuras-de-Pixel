extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	#get_tree().change_scene_to_file("res://escenas/Menu/menu.tscn")
	#Velocidad del tiempo
	Engine.time_scale = 0.5
	
	body.get_node("CollisionShape2D").queue_free()
	timer.start()


func _on_timer_timeout() -> void:
	# Velocidad por defecto
	Engine.time_scale = 1
	get_tree().reload_current_scene()
