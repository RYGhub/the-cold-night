extends Label


func _on_PhaseOne_survival_seconds_updated(_origin, value):
	# warning-ignore:NARROWING_CONVERSION
	text = Utils.format_time(value)
