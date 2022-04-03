extends Node

# Items
export var enemy: PackedScene = preload("res://src/entities/Enemy.tscn")
export var bullet_container_node_path: String = "../.."
onready var bullet_container_node: Node = get_node(bullet_container_node_path)

var _timer : Timer = null
var rng : RandomNumberGenerator = RandomNumberGenerator.new()

func _ready():
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.5)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	
	rng.randomize()


func _on_Timer_timeout():
	var position = Vector2(0, 0)
	var new_enemy = enemy.instance()
	
	var random = rng.randi_range(1, 4)
	if random == 1: position = Vector2(0, rng.randf_range(0, 640))
	elif random == 2: position = Vector2(1280, rng.randf_range(0, 640))
	elif random == 3: position = Vector2(rng.randf_range(0, 1280), 0)
	else: position = Vector2(rng.randf_range(0, 640), 640)
	
	new_enemy.set_position(position)
	bullet_container_node.add_child(new_enemy)
