extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animacao := $AnimatedSprite2D as AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Aplica a gravidade enquanto estiver no ar.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Inicia o salto no chão.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	print(direction)

	if direction:
		velocity.x = direction * SPEED
		animacao.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if position.y > 500:
		position.y = 0

	if not is_on_floor():
		animacao.play("jump")
	elif direction:
		animacao.play("run")
	else:
		animacao.play("idle")
