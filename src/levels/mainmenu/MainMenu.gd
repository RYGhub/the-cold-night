extends Node2D


func change_scn():
	var result = get_tree().change_scene("res://src/levels/Game.tscn")
	if result != OK:
		push_error("Could not change scene: %d" % [result])


func _on_Play_pressed():
	change_scn()
