extends Node2D


signal started_main_menu(origin)
signal started_phase_one(origin)
signal started_phase_two(origin)
signal started_bad_ending(origin)
signal started_good_ending(origin)


export(PackedScene) var main_menu = preload("res://src/levels/mainmenu/MainMenu.tscn")
export(PackedScene) var phase_one = preload("res://src/levels/phaseone/PhaseOne.tscn")
export(PackedScene) var phase_two = preload("res://src/levels/phasetwo/PhaseTwo.tscn")
export(PackedScene) var user_interface = preload("res://src/levels/ui/UserInterface.tscn")
export(PackedScene) var bad_ending = preload("res://src/levels/endings/BadEnding.tscn")
export(PackedScene) var good_ending = preload("res://src/levels/endings/GoodEnding.tscn")


var score


func _ready():
	print("Starting from the menu!")
	start_menu()


func start_menu():
	add_child(main_menu.instance())
	# warning-ignore: RETURN_VALUE_DISCARDED
	$MainMenu/TheDarkNightUI/Play.connect("pressed", self, "_on_MainMenu_Play_pressed", [])
	emit_signal("started_main_menu", self)


func start_one():
	print("Phase one!")
	add_child(phase_one.instance())
	add_child(user_interface.instance())
	# warning-ignore: RETURN_VALUE_DISCARDED
	$PhaseOne.connect("survival_seconds_updated", $UserInterface/TheDarkNightUI/TimeSurvived,"_on_PhaseOne_survival_seconds_updated")
	# warning-ignore: RETURN_VALUE_DISCARDED
	$PhaseOne/Entities/Fire/Firepit/Damageable.connect("health_changed", $Music, "_on_Fire_intensity_changed")
	# warning-ignore: RETURN_VALUE_DISCARDED
	$PhaseOne/Entities/Fire/Firepit/Damageable.connect("health_reached_min", self, "_on_Fire_died", [], CONNECT_ONESHOT)
	# warning-ignore: RETURN_VALUE_DISCARDED
	$UserInterface/TheDarkNightUI/MuteButton.connect("toggled", $Music, "_on_MuteButton_toggled")
	# warning-ignore: RETURN_VALUE_DISCARDED
	$PhaseOne/Entities/PhaseOnePlayer/Damageable.connect("health_changed", $UserInterface/TheDarkNightUI/HealthBar, "_on_PhaseOnePlayer_health_changed")
	# warning-ignore: RETURN_VALUE_DISCARDED
	$PhaseOne/Entities/PhaseOnePlayer/Damageable.connect("health_reached_min", self, "_on_Player_died", [], CONNECT_ONESHOT)
	emit_signal("started_phase_one", self)


func start_two():
	print("Phase two!")
	add_child(phase_two.instance())
	emit_signal("started_phase_two", self)


func start_good():
	print("Good ending!!!")
	add_child(good_ending.instance())
	emit_signal("started_good_ending", self)


func start_bad():
	print("Bad ending...")
	score = $PhaseOne.survival_seconds
	add_child(bad_ending.instance())
	# warning-ignore: RETURN_VALUE_DISCARDED
	$BadEnding/TheDarkNightUI/Play.connect("pressed", self, "_on_BadEnding_Replay_pressed", [])
	$BadEnding/TheDarkNightUI/Score.text = Utils.format_time(score)
	emit_signal("started_bad_ending", self)


func _on_Fire_died(_origin, _value):
	$PhaseOne.queue_free()
	$UserInterface.queue_free()
	start_bad()


func _on_Player_died(_origin, _value):
	$PhaseOne.queue_free()
	$UserInterface.queue_free()
	start_bad()


func _on_MainMenu_Play_pressed():
	$MainMenu.queue_free()
	start_one()


func _on_BadEnding_Replay_pressed():
	$BadEnding.queue_free()
	start_one()
