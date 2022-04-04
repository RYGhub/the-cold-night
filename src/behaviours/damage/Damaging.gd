extends Node
class_name Damaging


signal damaged(origin, damaged)


export(float) var damage
export(bool) var destroy_after_damage


onready var parent = get_parent()


func do_damage(to, multiplier):
	# Check if it is possible to damage the collider
	var damageable = to.get_node_or_null("Damageable")
	if damageable == null:
		return
	# Damage the collider!
	damageable.health += damage * multiplier
	# Emit the signal
	emit_signal("damaged", self, to)
	# Destroy self if necessary
	if destroy_after_damage:
		parent.queue_free()


func _on_BulletMovement_collided(_origin, collision):
	do_damage(collision.collider, 1)
