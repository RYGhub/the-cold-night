extends KinematicBody2D
class_name Arrow


export(Texture) var dim_texture
export(int) var dim_damage

export(Texture) var lit_texture
export(int) var lit_damage


func _on_Flammable_caught_fire(_origin):
	$Shape/Sprite.texture = lit_texture
	$Damaging.damage = lit_damage
	$Light.visible = true


func _on_Flammable_extinguished_fire(_origin):
	$Shape/Sprite.texture = dim_texture
	$Damaging.damage = dim_damage
	$Light.visible = false
