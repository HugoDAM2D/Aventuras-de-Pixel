extends Area2D

@onready var game_manager: Node = %GameManager
@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D



func _on_body_entered(body: Node2D) -> void:
	game_manager.incrementa_puntuacion()
	audio_stream_player.play()
	animated_sprite.visible = false
	collision_shape.call_deferred("set","disabled",true)


func _on_audio_stream_player_2d_finished() -> void:
	queue_free()
