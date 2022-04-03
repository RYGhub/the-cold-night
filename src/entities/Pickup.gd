extends Area2D


export var sprite: Texture = preload("res://src/mechanics/White.png") setget set_sprite, get_sprite
export var duration_seconds: float = 1.0 setget set_duration, get_duration
export var despawn_seconds: float = INF setget set_despawn, get_despawn

signal picked_up
signal expired
signal despawned


func _ready():
	set_sprite(sprite)
	set_duration(duration_seconds)
	set_despawn(despawn_seconds)


func set_sprite(value):
	$Shape/Sprite.texture = value

func get_sprite():
	return $Shape/Sprite.texture


func set_duration(value):
	$Duration.wait_time = value

func get_duration():
	return $Duration.wait_time

func _on_Duration_timeout():
	emit_signal("expired")
	queue_free()


func set_despawn(value):
	$Despawn.wait_time = value
	$Despawn.start()

func get_despawn():
	return $Despawn.wait_time

func _on_Despawn_timeout():
	if $Shape.visible:
		emit_signal("despawned")
		queue_free()


func pick_up():
	$Shape.visible = false
	$Duration.start()
	emit_signal("picked_up")

func _on_body_entered(_other: RigidBody2D):
	# TODO: check that it was the player who entered
	if $Shape.visible:
		pick_up()
