extends Node2D


func _ready():	
	for child in get_children():
		if child.name == "Play":
			get_node(child.name).connect("pressed", self, "change_scn")

func change_scn():
	get_tree().change_scene("res://src/levels/Game.tscn")

