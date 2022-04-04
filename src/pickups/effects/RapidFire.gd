extends Node
class_name RapidFire


onready var target = get_tree().root.find_node("PhaseOnePlayer", true, false).get_node("SpawnOnShoot/ShootOnClick")
onready var pickup: Area2D = get_parent()


func _on_picked_up():
	target.rapid_fire_instances += 1


func _on_expired():
	target.rapid_fire_instances -= 1
