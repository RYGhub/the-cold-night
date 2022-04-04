extends Node
class_name SetSpawnedGoalTo


export var goal_path: NodePath
onready var goal = get_node(goal_path)


func set_goal(node):
	var movement = node.get_node("AttractedToMovement")
	movement.goal = goal
