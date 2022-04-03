extends Node

onready var target: KinematicBody2D = get_parent()
onready var angle: float = deg2rad(target.get_rotation_degrees())
export var movement_per_second: float = 96.0

var direction : Vector2 = Vector2(0,0)

func _ready():
	direction = Vector2.ZERO
	
	direction += sin(angle) * Vector2.DOWN
	direction += cos(angle) * Vector2.RIGHT
	
	if direction.length() > 1:
		direction.normalized()
	
func _physics_process(delta):
	var _motion: Vector2 = target.move_and_slide(direction * movement_per_second)
