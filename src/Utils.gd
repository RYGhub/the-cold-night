class_name Utils


static func is_between(m, val, x):
	return (m < val) && (val <= x)


static func format_time(value):
	# warning-ignore: NARROWING_CONVERSION
	var minutes: int = floor(value / 60)
	var seconds_and_millis: float = value - minutes * 60
	var seconds: int = int(seconds_and_millis)
	var millis: int = int((seconds_and_millis - seconds) * 1000)
	return "%01d:%02d.%03d" % ([minutes, seconds, millis])