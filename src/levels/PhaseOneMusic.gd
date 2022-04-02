extends Node

export var fire_path: NodePath

export var choir_min: float = 0.05
export var choir_max: float = 0.20
export var bell_min: float = 0.20
export var bell_max: float = 0.60
export var drum_min: float = 0.40
export var drum_max: float = 0.80


func _ready():
	var fire = get_node(fire_path)
	fire.connect("intensity_changed", self, "_on_fire_intensity_changed")


func _on_fire_intensity_changed(value):
	$Choir.volume_db = (smoothstep(choir_min, choir_max, value) - 1) * 60
	$Bell.volume_db = (smoothstep(bell_min, bell_max, value) - 1) * 60
	$Drum.volume_db = (smoothstep(drum_min, drum_max, value) - 1) * 60
	pass
