extends Node
class_name SpawnOnShoot


signal shot(origin, bullet)


export(PackedScene) var spawning
export(float) var angle_offset
export(String) var container_name


onready var parent = get_parent()
onready var container = get_tree().root.find_node(container_name, true, false)


func shoot(angle):
	if not $Cooldown.is_stopped():
		return
	var node = spawning.instance()
	container.add_child(node)
	node.set_position(parent.global_position)
	node.set_rotation(angle + angle_offset)
	node.add_collision_exception_with(parent)
	$Sound.play()
	$Cooldown.start()
	emit_signal("shot", self, node)
