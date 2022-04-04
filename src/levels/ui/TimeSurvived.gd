extends Label


func _on_PhaseOne_survival_seconds_updated(_origin, value):
	# warning-ignore:NARROWING_CONVERSION
	var minutes: int = floor(value / 60)
	var seconds_and_millis: float = value - minutes * 60
	var seconds: int = int(seconds_and_millis)
	var millis: int = int((seconds_and_millis - seconds) * 1000)
	text = "%02d:%02d.%03d" % ([minutes, seconds, millis])
