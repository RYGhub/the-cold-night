extends Node
class_name Music


export var choir_min: float = 10
export var choir_max: float = 60
export var bell_min: float = 40
export var bell_max: float = 100
export var drum_min: float = 100
export var drum_max: float = 160
export var crackle_min: float = 0
export var crackle_max: float = 170
export var boss_min: float = 170
export var boss_max: float = 195
export var muted: bool setget set_mute, get_mute


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
	$FireCrackle.bus = "Master" if $FireCrackle.volume_db > -60 else "Mute"


func _on_Fire_intensity_changed(_origin, value):
	$Choir.volume_db = (smoothstep(choir_min, choir_max, value) - 1) * 60
	$Bell.volume_db = (smoothstep(bell_min, bell_max, value) - 1) * 60
	$Drum.volume_db = (smoothstep(drum_min, drum_max, value) - 1) * 60
	$FireCrackle.volume_db = (smoothstep(crackle_min, crackle_max, value) - 1) * 60
	$BossDrum.volume_db = (smoothstep(boss_min, boss_max, value) - 1) * 60
	update_state()


func _on_MuteButton_toggled(button_pressed):
	set_mute(button_pressed)


func _on_Game_started_main_menu(_origin):
	$Wind.play()
	$Wind.volume_db = 0
	$Wind.bus = "Master"
	$FireCrackle.play()
	$FireCrackle.volume_db = 0
	$FireCrackle.bus = "Master"

func _on_Game_started_phase_one(_origin):
	$Wind.stop()
	$FireCrackle.stop()	
	$Choir.play()
	$Bell.play()
	$Drum.play()
	$BossDrum.play()
	$BossGuitar.play()
	$FireCrackle.play()
	$FireCrackle.volume_db = -60
	update_state()

func _on_Game_started_bad_ending(_origin):
	$Choir.stop()
	$Bell.stop()
	$Drum.stop()
	$BossDrum.stop()
	$BossGuitar.stop()
	$FireCrackle.stop()
	$Wind.play()
	$Wind.volume_db = 0
	$Wind.bus = "Master"
