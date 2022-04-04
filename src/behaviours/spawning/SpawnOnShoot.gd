extends Node2D
class_name SpawnOnShoot


signal shot(bullet)


export var bullet: PackedScene
export var cooldown: float setget set_cooldown, get_cooldown
export var rapid_fire: bool
export var angle_offset: float


onready var parent: Node2D = get_parent()
onready var container: Node = get_tree().root.find_node("Bullets", true, false)


func set_cooldown(value):
	$Cooldown.wait_time = value

func get_cooldown() -> float:
	return $Cooldown.wait_time


func shoot(target):
	var node = bullet.instance()
	container.add_child(node)
	node.set_position(global_position)
	node.set_rotation(node.get_angle_to(target) + angle_offset)
	node.get_node("Ownership").entity_owner = parent
	node.add_collision_exception_with(parent)
	emit_signal("shot")
	$Sound.play()
	$Cooldown.start()


func _process(_delta):
	var not_on_cooldown: bool = $Cooldown.is_stopped()
	var trying_to_shoot: bool = Input.is_action_pressed("player_shoot") if rapid_fire else Input.is_action_just_pressed("player_shoot")

	if not_on_cooldown and trying_to_shoot:
		var target = get_global_mouse_position()
		shoot(target)
