extends Node2D
class_name Fire


func _on_Flame_body_entered(body):
	var flammable = body.get_node("Flammable")
	if flammable != null:
		flammable.catch_fire()


func _on_Damageable_health_changed(origin, value):
	var scale = smoothstep(origin.min_health, origin.max_health, value) * 2
	$Flame.scale = Vector2(scale, scale)
 
