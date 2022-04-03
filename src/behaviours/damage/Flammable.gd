extends Node
class_name Flammable


signal caught_fire
signal extinguished_fire


var on_fire = false


func catch_fire():
	if not on_fire:
		emit_signal("caught_fire")


func extinguish_fire():
	if on_fire:
		emit_signal("extinguished_fire")
