extends Node


export var amount_per_second: float = 0.2
onready var target = get_tree().root.find_node("Fire", true, false)
onready var pickup: Area2D = get_parent()

var active = false


func _on_picked_up():
	active = true


func _process(delta):
	if active:
		target.intensity += delta * amount_per_second
