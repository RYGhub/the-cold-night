extends Node
class_name Damageable


signal health_changed(origin, value)
signal health_reached_min(origin, value)
signal health_reached_max(origin, value)


export(float) var min_health
export(float) var max_health
export(float) var health setget set_health


onready var parent = get_parent()


func set_health(value):
	health = clamp(value, min_health, max_health)
	emit_signal("health_changed", self, value)
	if is_zero_approx(health - min_health):
		emit_signal("health_reached_min", self, value)
	if is_zero_approx(health - max_health):
		emit_signal("health_reached_max", self, value)
