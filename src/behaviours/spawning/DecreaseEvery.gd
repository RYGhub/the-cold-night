extends Timer


export(float) var multiplier


onready var parent = get_parent()


func _on_DecreaseEvery_timeout():
	parent.wait_time *= multiplier
