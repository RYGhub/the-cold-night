extends Node

export(PackedScene) var new_spawning


onready var target = get_tree().root.find_node("PhaseOnePlayer", true, false).get_node("SpawnOnShoot")
onready var pickup: Area2D = get_parent()


var previous_spawn


func _on_picked_up():
	previous_spawn = target.spawning
	target.spawning = new_spawning
	target.connect("shot", self, "_on_shot")


func _on_shot():
	target.spawning = previous_spawn
