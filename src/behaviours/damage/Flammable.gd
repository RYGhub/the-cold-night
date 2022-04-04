extends Node
class_name Flammable


signal caught_fire(origin)
signal extinguished_fire(origin)


var on_fire = false


func catch_fire():
	if not on_fire:
		on_fire = true
		emit_signal("caught_fire", self)


func extinguish_fire():
	if on_fire:
		on_fire = false
		emit_signal("extinguished_fire", self)
