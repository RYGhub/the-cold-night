extends Area2D


export var duration_seconds: float setget set_duration, get_duration
export var despawn_seconds: float setget set_despawn, get_despawn

signal picked_up
signal expired
signal despawned


func _ready():
	set_duration(duration_seconds)
	set_despawn(despawn_seconds)


func set_duration(value):
	if value > 0:
		$Duration.wait_time = value

func get_duration():
	return $Duration.wait_time

func _on_Duration_timeout():
	emit_signal("expired")
	queue_free()


func set_despawn(value):
	if value > 0:
		$Despawn.wait_time = value

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
