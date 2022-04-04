extends Node
class_name PlayerMovement


signal moving_in_direction(direction)


export var movement_per_second: float


onready var parent: KinematicBody2D = get_parent()


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

	emit_signal("moving_in_direction", direction)
	var _motion: Vector2 = parent.move_and_slide(direction * movement_per_second, Vector2.ZERO)
