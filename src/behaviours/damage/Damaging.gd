extends Node
class_name Damaging


export var damage: int
export var destroy_on_damage: bool
export var friendly_fire: bool


onready var parent: Node2D = get_parent()


func do_damage(to: Node):
	# Find the owner of this bullet
	var bullet_owner = Ownership.get_value(parent)
	# Check if the bullet should do damage
	var same_alliance = Alliance.compare(bullet_owner, to)
	if same_alliance and not friendly_fire:
		return
	# Check if it is possible to damage the collider
	var damageable = to.get_node("Damageable")
	if damageable == null:
		return
	# Damage the collider!
	damageable.health -= damage
	# Alas, destroy self
	if destroy_on_damage:
		parent.queue_free()


func do_damage_to_collider(collision: KinematicCollision2D):
	do_damage(collision.collider)
