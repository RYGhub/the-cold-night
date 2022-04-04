extends Area2D


signal picked_up
signal expired
signal despawned


var active = true setget set_active


func _on_Duration_timeout():
	emit_signal("expired")
	queue_free()


func _on_Despawn_timeout():
	if active:
		emit_signal("despawned")
		queue_free()


func pick_up():
	set_active(false)
	$Duration.start()
	emit_signal("picked_up")

func _on_body_entered(_other):
	if active:
		pick_up()


func set_active(value):
	active = value
	$Shape.visible = value
	$Shape.disabled = not value
