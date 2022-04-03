extends Node
class_name TeleportToScreenEdge


signal teleported(to)


export var bounds: Vector2


onready var parent = get_parent()
onready var rng = get_tree().root.get_node("Game/RNG").rng


func teleport():
	var random = rng.randi_range(1, 4)

	var new_position
	if random == 1: 
		# Left
		new_position = Vector2(0, rng.randf_range(0, bounds.y))
	elif random == 2: 
		# Right
		new_position = Vector2(bounds.x, rng.randf_range(0, bounds.y))
	elif random == 3: 
		# Top
		new_position = Vector2(rng.randf_range(0, bounds.x), 0)
	else: 
		# Bottom
		new_position = Vector2(rng.randf_range(0, bounds.y), bounds.y)
	
	parent.set_position(new_position)
	emit_signal("teleported", parent.position)
