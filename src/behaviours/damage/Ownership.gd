extends Node
class_name Ownership


var entity_owner = null


static func discover(node):
	var ownership_node = node.get_node("Ownership")
	if ownership_node != null:
		return ownership_node.entity_owner
	else:
		return null
