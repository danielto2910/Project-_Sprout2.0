extends CharacterBody2D
@onready var animation = $AnimatedSprite2D

const SPEED = 100.0
func _physics_process(delta: float) -> void:

	var direction := Input.get_vector("move_left","move_right","move_up","move_down")
	if direction:
		velocity = direction.normalized() * SPEED
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
	set_animation(direction)

func attack_target():
	print("ATTACKED")
	

func set_animation(direction):
	if direction.x > 0:
		animation.flip_h = false
	else:
		animation.flip_h = true
		
	if velocity:
		animation.play("walk")
	else:
		animation.play("idle")
