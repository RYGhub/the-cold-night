extends Node


export var bullet: PackedScene = preload("res://src/entities/Bullet.tscn")
export var bullet_container_node_path: String = "../.."
onready var bullet_container_node: Node = get_node(bullet_container_node_path)
onready var source: Node2D = get_parent()


func _process(_delta):
	if Input.is_action_just_pressed("player_shoot"):
		shoot()


func shoot():
	var new_bullet = bullet.instance()
	new_bullet.set_position(source.global_position)
	bullet_container_node.add_child(new_bullet)
	var rotation = new_bullet.get_angle_to(source.get_global_mouse_position())
	new_bullet.set_rotation(rotation)
