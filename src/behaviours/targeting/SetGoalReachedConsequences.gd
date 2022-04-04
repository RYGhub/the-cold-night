extends Node


signal goal_reached(who)


func set_consequences(node):
	var movement = node.get_node("AttractedToMovement")
	movement.connect("goal_reached", self, "_on_goal_reached")


func _on_goal_reached(who):
	emit_signal("goal_reached", who)
