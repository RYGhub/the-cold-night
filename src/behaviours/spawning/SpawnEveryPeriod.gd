extends Node
class_name SpawnEveryPeriod


signal spawned(origin, node)


export(PackedScene) var spawning
export(String) var container_name


onready var parent = get_parent()
onready var container = get_tree().root.find_node(container_name, true, false)


func spawn():
	if spawning == null:
		return
	var node = spawning.instance()
	container.add_child(node)
	node.set_position(parent.global_position)
	emit_signal("spawned", self, node)
