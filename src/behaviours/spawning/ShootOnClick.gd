extends Node
class_name ShootOnClick


export(int) var rapid_fire_instances


onready var parent = get_parent()


func _process(_delta):
	if Input.is_action_pressed("player_shoot") if rapid_fire_instances > 0 else Input.is_action_just_pressed("player_shoot"):
		var target = parent.parent.get_global_mouse_position()
		parent.shoot(parent.parent.get_angle_to(target))
