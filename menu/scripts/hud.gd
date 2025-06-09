extends CanvasLayer

@onready var contador: Label = $Contador
@onready var game_manager: Node = %GameManager

func _ready() -> void:
	visible = true
	var game_manager = get_node("%GameManager")
	game_manager.puntuacion_actualizada.connect(on_puntuacion_actualizada)
	
func on_puntuacion_actualizada(puntuacion_actual:int) -> void:
		contador.text = str(puntuacion_actual)
