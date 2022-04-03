extends Node


export var branch: PackedScene = preload("res://src/entities/Pickup.tscn")
export var branch_container_node_path: String = "../.."
onready var branch_container_node: Node = get_node(branch_container_node_path)
onready var source: Node2D = get_parent()


func BranchSpawn():
	var new_branch = branch.instance()
	new_branch.set_position(source.global_position)
	branch_container_node.add_child(new_branch)
