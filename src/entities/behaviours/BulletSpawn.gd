extends Position2D

# Items
onready var bullet = preload("res://src/entities/Bullet.tscn")
onready var spawner = get_node("/root/Game/PhaseOne/PhaseOneContainer/Player")

func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		_on_Click()

func _on_Click():
	var newBullet = bullet.instance()
	newBullet.set_position(spawner.position)
	var bulletRotation = rad2deg(newBullet.get_angle_to(get_global_mouse_position()))
	newBullet.set_rotation_degrees(bulletRotation)
	add_child(newBullet)
	
