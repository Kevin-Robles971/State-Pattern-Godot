class_name IdleState
extends State

func enter() -> void:
	enemy.play_animation("idle", "idle")

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass

func exit() -> void:
	pass
