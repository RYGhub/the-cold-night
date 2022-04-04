extends Node
class_name DropLoot


export(Array, PackedScene) var loot_types
export(Array, float) var loot_weights
export(String) var container_name


onready var source = get_parent()
onready var container = get_tree().root.find_node(container_name, true, false)
onready var rng = get_tree().root.get_node("Game/RNG").rng


func _ready():
	if len(loot_types) != len(loot_weights):
		push_error("The amount of loot types and loot weights is different!")


func select_drop():
	var total_weights = 0.0
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


func create_drop():
	var scene = select_drop()
	# Allow dropping nothing
	if scene == null:
		return null
	
	var node = scene.instance()
	container.add_child(node)
	node.set_position(source.global_position)
	return node


func _on_Damageable_health_reached_min(_origin, _value):
	create_drop()
