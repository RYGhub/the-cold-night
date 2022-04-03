extends Node

onready var target: KinematicBody2D = get_parent()
export var movement_per_second: float = 400.0


func _physics_process(delta):
	var direction = Vector2(cos(target.rotation), sin(target.rotation))
	var _motion: Vector2 = target.move_and_slide(direction * movement_per_second)
