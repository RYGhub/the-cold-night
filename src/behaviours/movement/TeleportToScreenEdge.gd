extends Node
class_name TeleportToRandomPosition


signal teleported(origin)


export(Vector2) var bounds


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
		new_position = Vector2(rng.randf_range(0, bounds.x), bounds.y)
	
	parent.set_position(new_position)
	emit_signal("teleported", self)


func _on_SpawnEveryPeriod_spawned(_origin, _node):
	teleport()
