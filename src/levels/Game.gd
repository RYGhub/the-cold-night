extends Node2D


var survival_seconds: float setget set_survival_seconds
signal survival_seconds_updated(value)


func set_survival_seconds(value):
	survival_seconds = value
	emit_signal("survival_seconds_updated", value)


func _process(delta):
	set_survival_seconds(survival_seconds + delta)
