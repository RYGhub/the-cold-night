extends CanvasLayer


signal survival_seconds_updated(origin, value)


var survival_seconds = 0 setget set_survival_seconds


func set_survival_seconds(value):
	survival_seconds = value
	emit_signal("survival_seconds_updated", self, value)


func _process(delta):
	set_survival_seconds(survival_seconds + delta)
