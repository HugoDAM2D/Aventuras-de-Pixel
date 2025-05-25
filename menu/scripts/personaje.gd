extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var posicion_inicial: Vector2

func _ready():
	posicion_inicial = position

func reiniciar_posicion():
	position = posicion_inicial

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("saltar") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		audio_stream_player_2d.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("moverIzquierda", "moverDerecha")
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true;
	if is_on_floor():	
		if direction == 0:
			animated_sprite.play("reposo")
		else:
			animated_sprite.play("correr")
	else:
		animated_sprite.play("saltar2")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func aplicar_impulso_hacia_arriba(cantidad_impulso : float) -> void:
	velocity.y = -cantidad_impulso
