extends Position2D

# Items
onready var bullet = preload("res://src/entities/Bullet.tscn")
onready var spawner = get_node("/root/Game/PhaseOne/PhaseOneContainer/Player")

func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		_on_Click()

func _on_Click():
	var new_bullet = bullet.instance()
	new_bullet.set_position(spawner.position)
	var bullet_rotation = rad2deg(new_bullet.get_angle_to(get_global_mouse_position()))
	new_bullet.set_rotation_degrees(bullet_rotation)
	add_child(new_bullet)
