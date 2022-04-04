extends Node
class_name DropLoot


export(Array, PackedScene) var loot_types
export(Array, float) var loot_weights


# This may break if the container structure is changed
onready var source: Node2D = get_parent()
onready var container: Node = get_node(@"../../../Pickups")
onready var rng: RandomNumberGenerator = get_tree().root.get_node("Game/RNG").rng


func _ready():
	if len(loot_types) != len(loot_weights):
		push_error("The amount of loot types and loot weights is different!")


func select_drop() -> PackedScene:
	var total_weights: float = 0.0
	for weight in loot_weights:
		total_weights += weight
	
	var result = rng.randf_range(0.0, total_weights)
	
	for i in range(len(loot_types)):
		var loot_type = loot_types[i]
		var loot_weight = loot_weights[i]
		result -= loot_weight
		if result <= 0:
			return loot_type
	
	push_error("Couldn't select loot type; something went wrong during the calculation!")
	return null


func create_drop() -> Node:
	var scene = select_drop()
	# Allow dropping nothing
	if scene == null:
		return null
	
	var node = scene.instance()
	node.set_position(source.global_position)
	container.add_child(node)
	return node
