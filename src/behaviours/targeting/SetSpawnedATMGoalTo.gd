extends Node
class_name SetSpawnedATMGoalTo


signal set_goal(origin, target)


export(NodePath) var goal_path


onready var goal = get_node(goal_path)


func set_goal(node):
	var movement = node.get_node("AttractedToMovement")
	movement.goal = goal
	emit_signal("set_goal", self, movement)


func _on_SpawnEveryPeriod_spawned(_origin, node):
	set_goal(node)
