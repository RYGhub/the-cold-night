extends Node
class_name ChangeFireIntensity


export var amount_per_second: float = 0.2


onready var target = get_tree().root.find_node("Fire", true, false).get_node("Firepit/Damageable")
onready var pickup: Area2D = get_parent()


var active = false


func _on_picked_up():
	active = true


func _process(delta):
	if active:
		target.health += delta * amount_per_second
