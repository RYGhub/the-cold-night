extends Node
class_name Damaging


signal damaged(origin, damaged)


export(float) var damage
export(bool) var destroy_after_damage
export(bool) var friendly_fire


onready var parent = get_parent()


func do_damage(to, multiplier):
	# Should alliances be considered?
	if not friendly_fire:
		# Find the owner of this bullet
		var bullet_owner = Ownership.discover(parent)
		# Check if the bullet should do damage
		var same_alliance = Alliance.discover_and_compare(bullet_owner, to)
		if same_alliance and not friendly_fire:
			return

	# Check if it is possible to damage the collider
	var damageable = to.get_node("Damageable")
	if damageable == null:
		return
	# Damage the collider!
	damageable.health += damage * multiplier
	# Emit the signal
	emit_signal("damaged", self, to)

