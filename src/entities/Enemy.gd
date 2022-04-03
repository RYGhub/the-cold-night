extends KinematicBody2D


func _on_Damageable_dead():
	for child in get_children():
		if child.name == "BranchSpawn":
			child.BranchSpawn()
	queue_free()
