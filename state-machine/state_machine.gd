class_name StateMachine
extends Node

var current_state: State
var states: Dictionary = {
	
}

func _ready() -> void:
	states = {
		"idle" = IdleState.new(),
		"alert" = AlertState.new(),
		"chase" = ChaseState.new(),
		"attack" = AttackState.new()
	}
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
		current_state.physics_update(delta)
	pass
	
func initialize(p_enemy: CharacterBody2D, p_player:CharacterBody2D) -> void:
	for state in states.values():
		state.enemy = p_enemy
		state.player = p_player
	change_state("idle")
