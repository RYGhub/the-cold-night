extends KinematicBody2D
class_name ArrowAlternative


export var dim_texture: Texture = preload("res://src/entities/bullets/ArrowAlternative.png")
export var dim_damage: int = 1

export var lit_texture: Texture = preload("res://src/entities/bullets/ArrowAlternativeOnFire.png")
export var lit_damage: int = 5


func _on_Flammable_caught_fire():
	$Shape/Sprite.texture = lit_texture
	$Damaging.damage = lit_damage
	$Damaging.destroy_on_damage = false
	$Light.visible = true


func _on_Flammable_extinguished_fire():
	$Shape/Sprite.texture = dim_texture
	$Damaging.damage = dim_damage
	$Damaging.destroy_on_damage = true
	$Light.visible = false
