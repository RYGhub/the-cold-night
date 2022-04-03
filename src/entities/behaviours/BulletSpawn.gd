extends Node


export var bullet: PackedScene = preload("res://src/entities/Bullet.tscn")
export var bullet_container_node_path: String = "../.."
onready var bullet_container_node: Node = get_node(bullet_container_node_path)
onready var source: Node2D = get_parent()
var _timer : Timer = null

func _ready():
	_timer = Timer.new()
	add_child(_timer)
	_timer.set_wait_time(0.3)
	_timer.set_one_shot(true)
	_timer.start()

func _process(_delta):
	print(_timer.get_time_left())
	if Input.is_action_just_pressed("player_shoot") and _timer.get_time_left()==0:
		shoot()
		
		#restart timer
		_timer.set_wait_time(0.3)
		_timer.set_one_shot(true)
		_timer.start()


func shoot():
	var new_bullet = bullet.instance()
	new_bullet.set_position(source.global_position)
	bullet_container_node.add_child(new_bullet)
	var rotation = new_bullet.get_angle_to(source.get_global_mouse_position())
	new_bullet.set_rotation(rotation)
	new_bullet.get_node("Ownership").entity_owner = source
	new_bullet.add_collision_exception_with(source)
