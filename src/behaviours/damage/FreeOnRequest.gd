extends Node
class_name FreeOnRequest


onready var parent = get_parent()


func _on_Damageable_health_reached_min(_origin, _value):
	parent.queue_free()
