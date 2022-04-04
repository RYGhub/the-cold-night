extends Node
class_name Music


export var choir_min: float = 0.05
export var choir_max: float = 0.30
export var bell_min: float = 0.20
export var bell_max: float = 0.60
export var drum_min: float = 0.40
export var drum_max: float = 0.80
export var muted: bool setget set_mute, get_mute


func _ready():
	update_state()


func set_mute(value):
	var index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(index, value)

func get_mute():
	var index = AudioServer.get_bus_index("Master")
	return AudioServer.is_bus_mute(index)


func update_state():
	$Choir.bus = "Master" if $Choir.volume_db > -60 else "Mute"
	$Bell.bus = "Master" if $Bell.volume_db > -60 else "Mute"
	$Drum.bus = "Master" if $Drum.volume_db > -60 else "Mute"
	$BossDrum.bus = "Master" if $BossDrum.volume_db > -60 else "Mute"
	$BossGuitar.bus = "Master" if $BossGuitar.volume_db > -60 else "Mute"
	$Wind.bus = "Master" if $Wind.volume_db > -60 else "Mute"
	$FireCrackle.bus = "Master" if $FireCrackle.volume_db > -60 else "Mute"



func _on_Fire_intensity_changed(value):
	$Choir.volume_db = (smoothstep(choir_min, choir_max, value) - 1) * 60
	$Bell.volume_db = (smoothstep(bell_min, bell_max, value) - 1) * 60
	$Drum.volume_db = (smoothstep(drum_min, drum_max, value) - 1) * 60
	update_state()


func _on_MuteButton_toggled(button_pressed):
	set_mute(button_pressed)
