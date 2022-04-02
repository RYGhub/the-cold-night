extends Node


export var movement_per_second: float = 96.0


onready var target: KinematicBody2D = get_parent()


func _physics_process(_delta):
	var direction = Vector2.ZERO
	direction += Input.get_action_strength("player_move_up") * Vector2.UP
	direction += Input.get_action_strength("player_move_down") * Vector2.DOWN
	direction += Input.get_action_strength("player_move_left") * Vector2.LEFT
	direction += Input.get_action_strength("player_move_right") * Vector2.RIGHT
	# If using a controller, allow going slower than the default speed, but not faster
	# Basically, "cap" movement at 1
	if direction.length() > 1:
		direction.normalized()

	var _motion: Vector2 = target.move_and_slide(direction * movement_per_second, Vector2.ZERO)
