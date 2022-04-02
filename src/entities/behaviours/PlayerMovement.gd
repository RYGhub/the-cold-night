extends Node


export var movement_per_second: float = 96.0


onready var target: KinematicBody2D = get_parent()


func _physics_process(_delta):
	var total_input = Vector2.ZERO
	total_input += Input.get_action_strength("player_move_up") * Vector2.UP
	total_input += Input.get_action_strength("player_move_down") * Vector2.DOWN
	total_input += Input.get_action_strength("player_move_left") * Vector2.LEFT
	total_input += Input.get_action_strength("player_move_right") * Vector2.RIGHT
	# If using a controller, allow going slower than the default speed, but not faster
	# Basically, "cap" movement at 1
	if total_input.length() > 1:
		total_input.normalized()

	var _motion: Vector2 = target.move_and_slide(total_input * movement_per_second, Vector2.ZERO)
