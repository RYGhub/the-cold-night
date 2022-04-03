extends Node
class_name RandomRotationOnReady


onready var parent: Node2D = get_parent()
onready var rng: RandomNumberGenerator = get_tree().root.get_node("Game/RNG").rng


func _ready():
	parent.rotate(rng.randf() * 2 * PI)
