class_name ChaseState
extends State

func enter() -> void:
	enemy.play_animation("chase","chase")
	pass

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	enemy.chase_player()
	pass

func exit() -> void:
	pass
