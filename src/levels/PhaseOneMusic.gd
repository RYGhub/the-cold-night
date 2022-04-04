extends Node


export var choir_min: float = 0.05
export var choir_max: float = 0.30
export var bell_min: float = 0.20
export var bell_max: float = 0.60
export var drum_min: float = 0.40
export var drum_max: float = 0.80
export var muted: bool = false setget set_mute


func _on_Fire_intensity_changed(value):
	$Choir.volume_db = (smoothstep(choir_min, choir_max, value) - 1) * 60
	$Choir.bus = "Master" if not muted and $Choir.volume_db > -60 else "Mute"

	$Bell.volume_db = (smoothstep(bell_min, bell_max, value) - 1) * 60
	$Bell.bus = "Master" if not muted and $Bell.volume_db > -60 else "Mute"

	$Drum.volume_db = (smoothstep(drum_min, drum_max, value) - 1) * 60
	$Drum.bus = "Master" if not muted and  $Drum.volume_db > -60 else "Mute"


func set_mute(value):
	muted = value
	$Choir.bus = "Master" if not muted and $Choir.volume_db > -60 else "Mute"
	$Bell.bus = "Master" if not muted and $Bell.volume_db > -60 else "Mute"
	$Drum.bus = "Master" if not muted and  $Drum.volume_db > -60 else "Mute"


func _on_MuteButton_pressed():
	set_mute(not muted)
