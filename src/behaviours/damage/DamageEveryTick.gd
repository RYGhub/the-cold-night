extends Node
class_name DamageEveryTick


onready var parent = get_parent()
onready var target = parent.get_parent()


func _process(delta):
	parent.do_damage(target, delta)
