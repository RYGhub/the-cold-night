extends Node2D


signal health_changed(value)
signal dead


export var health: int = 1 setget set_health, get_health
export var max_health: int = 1


onready var parent: Node = get_parent()


func set_health(value):
	health = value
	emit_signal("health_changed", value)
	if health <= 0:
		emit_signal("dead")
		# WIP
		parent.queue_free()


func get_health():
	return health
