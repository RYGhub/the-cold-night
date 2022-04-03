extends AudioStreamPlayer

func _ready():
	set_stream(load("res://src/Sounds/arrow.mp3"))
	play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
