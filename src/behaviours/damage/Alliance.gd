extends Node
class_name Alliance


signal alliance_changed(origin, value)


enum AllianceKind {
	ENEMY = -1,
	NONE = 0,
	PLAYER = 1,
}


export(AllianceKind) var alliance setget set_alliance


func set_alliance(value):
	alliance = value
	emit_signal("alliance_changed", self, value)


static func discover(node):
	var alliance_node = node.get_node("Alliance")
	if alliance_node != null:
		return alliance_node.alliance
	else:
		return AllianceKind.NONE


static func discover_and_compare(first, second):
	return discover(first) == discover(second)
