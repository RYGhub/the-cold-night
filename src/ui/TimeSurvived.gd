extends Label


func _ready():
	var game = get_tree().root.get_node("Game")
	game.connect("survival_seconds_updated", self, "_on_survival_seconds_updated")


func _on_survival_seconds_updated(value: float):
	# warning-ignore:NARROWING_CONVERSION
	var minutes: int = floor(value / 60)
	var seconds_and_millis: float = value - minutes * 60
	var seconds: int = int(seconds_and_millis)
	var millis: int = int((seconds_and_millis - seconds) * 1000)
	text = "%02d:%02d.%03d" % ([minutes, seconds, millis])
