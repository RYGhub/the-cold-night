extends Node
class_name PlayerMovement


signal moved_in_direction(origin, direction)
signal collided(origin, collision)


export var movement_per_second: float


onready var parent: KinematicBody2D = get_parent()


func _read_direction():
	var direction = Vector2.ZERO
	direction += Input.get_action_strength("player_move_up") * Vector2.UP
	direction += Input.get_action_strength("player_move_down") * Vector2.DOWN
	direction += Input.get_action_strength("player_move_left") * Vector2.LEFT
	direction += Input.get_action_strength("player_move_right") * Vector2.RIGHT
	# If using a controller, allow going slower than the default speed, but not faster
	# Basically, "cap" movement at 1
	if direction.length() > 1:
		direction.normalized()
	return direction


func _move():
	var direction = _read_direction()
	var _motion = parent.move_and_slide(direction * movement_per_second, Vector2.ZERO)
	_handle_collisions()
	emit_signal("moved_in_direction", self, direction.normalized())


func _handle_collisions():
	for slide_no in parent.get_slide_count():
		var collision = parent.get_slide_collision(slide_no)
		emit_signal("collided", self, collision)


func _physics_process(_delta):
	_move()
