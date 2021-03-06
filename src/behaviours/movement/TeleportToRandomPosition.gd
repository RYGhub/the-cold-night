extends Node
class_name TeleportToScreenEdge


signal teleported(origin)


export(Vector2) var bounds


onready var parent = get_parent()
onready var rng = get_tree().root.get_node("Game/RNG").rng


func teleport():
	var new_position = Vector2(
		rng.randf_range(0, bounds.x),
		rng.randf_range(0, bounds.y)
	)
	
	parent.set_position(new_position)
	emit_signal("teleported", self)


func _handle_spawned(_node):
	teleport()
