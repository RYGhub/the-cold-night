extends KinematicBody2D


export var damage: int = 1


func _on_BulletMovement_hit(collision: KinematicCollision2D):
	# Find the owner of this bullet
	var bullet_owner = Ownership.get_value(self)
	# Check if the bullet should do damage		
	var same_alliance = Alliance.compare(bullet_owner, collision.collider)
	if same_alliance:
		return
	# Check if it is possible to damage the collider
	var damageable = collision.collider.get_node("Damageable")
	if damageable == null:
		return
	# Damage the collider!
	damageable.health -= damage
	# Alas, destroy self
	queue_free()
