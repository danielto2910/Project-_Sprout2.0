extends CharacterBody2D
@onready var animation = $AnimatedSprite2D
const DASH_SPEED = 300.0
const SPEED = 100.0
func _physics_process(delta: float) -> void:
	
	var direction := Input.get_vector("move_left","move_right","move_up","move_down")
	if direction:
		velocity = direction.normalized() * SPEED
		if Input.is_action_pressed("dash"):
			dash(direction)
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
	set_animation(direction)

func attack_target():
	print("ATTACKED")
	

func dash(direction):
	velocity = direction * DASH_SPEED

func set_animation(direction):
	if direction.x > 0:
		animation.flip_h = false
	else:
		animation.flip_h = true
		
	if velocity:
		animation.play("walk")
	else:
		animation.play("idle")
