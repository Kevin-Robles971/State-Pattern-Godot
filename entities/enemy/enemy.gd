extends CharacterBody2D

#utilixe @export en lugar de @onready para asignar los valores desde el editor
@export var animation:AnimatedSprite2D 
@export var message:AnimatedSprite2D 
@export var state_machine: StateMachine
@export var pivote:Node2D

@onready var player:CharacterBody2D = get_tree().get_first_node_in_group("player")

var speed:float = 130.0


func _ready() -> void:
	state_machine.initialize(self, player)
	$attack_area.area_entered.connect(change_state.bind("attack"))
	$alert_area.area_entered.connect(change_state.bind("alert"))
	$chase_area.area_entered.connect(change_state.bind("chase"))
	
	$attack_area.area_exited.connect(change_state.bind("chase"))
	$alert_area.area_exited.connect(change_state.bind("idle"))
	$chase_area.area_exited.connect(change_state.bind("alert"))

func change_state(area: Area2D,nombre:String):
	if area.is_in_group("player"):
		if nombre == "attack":
			state_machine.change_state("attack")
		if nombre == "alert":
			state_machine.change_state("alert")
		if nombre == "chase":
			state_machine.change_state("chase")
		if nombre == "idle":
			state_machine.change_state("idle")
func play_animation(current_animation:String, current_message:String):
	animation.play(current_animation)
	message.play(current_message)

func chase_player() -> void:
	var direction:Vector2 = global_position.direction_to(player.global_position)
	velocity = direction * speed
	if direction.x > 0:
		animation.flip_h = true
		pivote.scale.x = -1
	else:
		animation.flip_h = false
		pivote.scale.x = 1
	move_and_slide()
