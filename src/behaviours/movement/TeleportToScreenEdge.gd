extends Node
class_name TeleportToRandomPosition


signal teleported(to)


export var bounds: Vector2


onready var parent = get_parent()
onready var rng = get_tree().root.get_node("Game/RNG").rng


func teleport():
	var new_position = Vector2(
		rng.randf_range(0, bounds.x),
		rng.randf_range(0, bounds.y)
	)
	
	parent.set_position(new_position)
	emit_signal("teleported", parent.position)
