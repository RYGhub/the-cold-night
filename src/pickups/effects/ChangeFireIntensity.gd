extends Node


export var target_path: NodePath = NodePath("../../Fire")
export var amount_per_second: float = 0.2
onready var target = get_node(target_path)
onready var pickup: Area2D = get_parent()

var active = false


func _ready():
	# warning-ignore: RETURN_VALUE_DISCARDED
	pickup.connect("picked_up", self, "_on_picked_up")


func _on_picked_up():
	active = true


func _process(delta):
	if active:
		target.intensity += delta * amount_per_second
