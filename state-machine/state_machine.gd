class_name state_machine
extends Node

var current_state: state
var states: Dictionary = {
	
}

func _ready() -> void:
	pass

func change_state(new_state:String) -> void:
	if current_state:
		current_state.exit()
		
	current_state = states.get(new_state)
	
	if current_state:
		current_state.enter()

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)
	pass

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.phisics_update(delta)
	pass
	
func initialize(character: CharacterBody2D) -> void:
	for state in states.values():
		state.enemy = character
