extends Node2D
class_name SpawnEveryPeriod


signal spawned(node)


export var spawning: PackedScene
export var bounds: Vector2 setget set_bounds, get_bounds
export var period_secs: float setget set_period, get_period


onready var container = get_parent()


func spawn():
	if spawning == null:
		return
	var node: Node2D = spawning.instance()
	container.add_child(node)
	node.set_position(global_position)
	emit_signal("spawned", node)


func set_bounds(value):
	$TeleportToScreenEdge.bounds = value
	
func get_bounds():
	return $TeleportToScreenEdge.bounds


func set_period(value):
	$Period.wait_time = value

func get_period():
	return $Period.wait_time
