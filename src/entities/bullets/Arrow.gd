extends KinematicBody2D
class_name Arrow


export(Texture) var dim_texture
export(float) var dim_damage
export(bool) var dim_piercing

export(Texture) var lit_texture
export(float) var lit_damage
export(bool) var lit_piercing


func _ready():
	$Shape/Sprite.texture = dim_texture
	$Damaging.damage = dim_damage
	$Damaging.destroy_after_damage = not dim_piercing
	$Light.visible = false


func _on_Flammable_caught_fire(_origin):
	$Shape/Sprite.texture = lit_texture
	$Damaging.damage = lit_damage
	$Damaging.destroy_after_damage = not lit_piercing
	$Light.visible = true


func _on_Flammable_extinguished_fire(_origin):
	$Shape/Sprite.texture = dim_texture
	$Damaging.damage = dim_damage
	$Damaging.destroy_after_damage = not dim_piercing
	$Light.visible = false
