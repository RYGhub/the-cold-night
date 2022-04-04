extends Node
class_name RapidFire


export var new_cooldown: float

onready var target = get_tree().root.find_node("PhaseOnePlayer", true, false)
onready var pickup: Area2D = get_parent()


func _on_picked_up():
	var shoot = target.get_node("SpawnOnShoot")
	shoot.cooldown = new_cooldown
	shoot.rapid_fire = true

