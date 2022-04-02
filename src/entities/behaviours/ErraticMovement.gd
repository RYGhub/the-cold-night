extends Node


export var movement_per_second: float = 16.0


onready var target: KinematicBody2D = get_parent()
onready var rng = RandomNumberGenerator.new()


func _physics_process(_delta):
	var direction: Vector2 = Vector2(rng.randf_range(-1, 1), rng.randf_range(-1, 1)).normalized()
	var _motion: Vector2 = target.move_and_slide(direction * movement_per_second, Vector2.ZERO)
	