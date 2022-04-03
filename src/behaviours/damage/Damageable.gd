extends Node


export var health: int = 1 setget set_health, get_health
export var max_health: int = 1

signal health_changed(value)
signal dead


func set_health(value):
	health = value
	emit_signal("health_changed", value)
	if health <= 0:
		emit_signal("dead")

func get_health():
	return health
