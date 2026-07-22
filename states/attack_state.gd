class_name AttackState
extends State

func enter() -> void:
	enemy.play_animation("attack")
	pass

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass

func exit() -> void:
	pass
