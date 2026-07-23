extends CharacterBody2D

const SPEED:float = 300.0
const FRICTION:int = 1200
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	move_simple(delta)
	pass

func move_simple(delta):
	var direction:Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO,FRICTION*delta)

	move_and_slide()
