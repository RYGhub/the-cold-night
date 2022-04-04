extends TextureProgress


func _on_PhaseOnePlayer_health_changed(origin, _value):
	max_value = origin.max_health
	min_value = origin.min_health
	value = origin.health
