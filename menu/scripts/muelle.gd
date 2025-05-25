extends AnimatedSprite2D

@export var fuerza_impulso:float = 700

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.aplicar_impulso_hacia_arriba(fuerza_impulso)
	play("activado");
