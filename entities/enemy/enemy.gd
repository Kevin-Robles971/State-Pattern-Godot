extends CharacterBody2D

#utilixe @export en lugar de @onready para asignar los valores desde el editor
@export var animation:AnimatedSprite2D 
@export var state_machine: Node

var speed:int = 300
var player:CharacterBody2D = get_tree().get_first_node_in_group("player")

func _ready() -> void:
	state_machine.initialize(self, player)
	pass # Replace with function body.
	
func play_animation(current_animation:String):
	animation.play(current_animation)
	pass
	
func chanse_player():
	var direction:Vector2 = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
	pass
