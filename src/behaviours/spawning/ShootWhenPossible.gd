extends Node
class_name ShootWhenPossible


onready var parent = get_parent()


func _process(_delta):
	parent.shoot(parent.parent.rotation)
