extends CharacterBody2D


const SPEED = 700.0
var direction = -1
@onready var batevolta = $batevolta as RayCast2D

func _physics_process(delta: float) -> void:
	# Tratamento da gravidade
	if not is_on_floor():
		velocity += get_gravity() * delta


	if batevolta.is_colliding():
		direction *= -1
		batevolta.scale.x *= -1
		$animacao.scale.x *= -1


	# Movimento horizontal do personagem
	velocity.x = direction * SPEED * delta
	

	move_and_slide()
