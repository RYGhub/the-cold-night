extends Node
class_name Ownership


var entity_owner: Node = null


static func get_value(first) -> Node:
	var first_node = first.get_node("Ownership")
	var first_eowner = null
	if first_node != null:
		first_eowner = first_node.entity_owner
	return first_eowner
