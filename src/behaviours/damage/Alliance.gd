extends Node
class_name Alliance


enum AllianceKind {
	ENEMY = -1,
	NONE = 0,
	PLAYER = 1,
}

export(AllianceKind) var alliance: int


static func get_value(first) -> int:
	var first_node = first.get_node("Alliance")
	var first_alliance = null
	if first_node != null:
		first_alliance = first_node.alliance
	return first_alliance


static func compare(first, second) -> bool:
	return get_value(first) == get_value(second)
