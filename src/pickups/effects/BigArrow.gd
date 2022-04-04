extends Node


export(PackedScene) var old_spawning
export(PackedScene) var new_spawning


onready var target = get_tree().root.find_node("PhaseOnePlayer", true, false).get_node("SpawnOnShoot")
onready var pickup: Area2D = get_parent()



func _on_picked_up():
	target.spawning = new_spawning
	target.connect("shot", self, "_on_shot", [], CONNECT_ONESHOT)


func _on_shot(_origin, _whatever):
	target.spawning = old_spawning
