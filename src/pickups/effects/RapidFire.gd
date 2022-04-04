extends Node
class_name RapidFire



onready var target = get_tree().root.find_node("PhaseOnePlayer", true, false).get_node("SpawnOnShoot")
onready var target_click = target.get_node("ShootOnClick")
onready var target_cooldown = target.get_node("Cooldown")
onready var pickup: Area2D = get_parent()


func _on_picked_up():
	target_click.rapid_fire_instances += 1
	target_cooldown.wait_time /= 2


func _on_expired():
	target_click.rapid_fire_instances -= 1
	target_cooldown.wait_time *= 2

