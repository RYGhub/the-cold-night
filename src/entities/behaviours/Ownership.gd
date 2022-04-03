extends Node
class_name Ownership


var entity_owner: Node = null


static func get_value(first) -> Node:
	var first_node = first.get_node("Ownership")
	var first_alliance = null
	if first_node != null:
		first_alliance = first_node.alliance
	return first_alliance
