extends Node
class_name SetSpawnedGoalTo


export var goal_path: NodePath


func set_goal(node):
	var movement = node.get_node("AttractedToMovement")
	movement.goal = get_node(goal_path)
