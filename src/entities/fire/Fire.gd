extends Node2D


export var intensity: float = 0.5 setget set_intensity
export var change_per_second: float = - 1.0 / 60.0
export var min_intensity: float = 0
export var max_intensity: float = INF

signal intensity_changed(value)
signal intensity_at_max
signal intensity_at_min
var intensity_reached_max_triggered: bool = false
var intensity_reached_min_triggered: bool = false
signal intensity_reached_min
signal intensity_reached_max


func set_intensity(value):
	intensity = clamp(value, min_intensity, max_intensity)
	# Update everything that needs to be updated when the intensity changes
	$Flame.scale = Vector2(value, value)
	# Trigger signals
	emit_signal("intensity_changed", intensity)
	# max intensity signal
	if intensity == max_intensity:
		emit_signal("intensity_at_max")
		if not intensity_reached_max_triggered:
			emit_signal("intensity_reached_max")
			intensity_reached_max_triggered = true
	else:
		intensity_reached_max_triggered = false
	# min intensity signal
	if intensity == min_intensity:
		emit_signal("intensity_at_min")
		if not intensity_reached_min_triggered:
			emit_signal("intensity_reached_min")
			intensity_reached_min_triggered = true
	else:
		intensity_reached_min_triggered = false


func _process(delta):
	set_intensity(intensity + (delta * change_per_second))


func _on_Flame_body_entered(body: PhysicsBody2D):
	var flammable = body.get_node("Flammable")
	if flammable != null:
		flammable.catch_fire()
