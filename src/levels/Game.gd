extends Node2D


export(PackedScene) var main_menu = preload("res://src/levels/mainmenu/MainMenu.tscn")
export(PackedScene) var phase_one = preload("res://src/levels/phaseone/PhaseOne.tscn")
export(PackedScene) var user_interface = preload("res://src/levels/ui/UserInterface.tscn")


func _ready():
	print("Starting from the menu!")
	add_child(main_menu.instance())
	# warning-ignore: RETURN_VALUE_DISCARDED
	$MainMenu/TheDarkNightUI/Play.connect("pressed", self, "_on_MainMenu_Play_pressed")


func _on_MainMenu_Play_pressed():
	print("Moving to the first phase...")
	$MainMenu.queue_free()
	add_child(phase_one.instance())
	add_child(user_interface.instance())
	# warning-ignore: RETURN_VALUE_DISCARDED
	$PhaseOne.connect("survival_seconds_updated", $UserInterface/TheDarkNightUI/TimeSurvived,"_on_PhaseOne_survival_seconds_updated")
	# warning-ignore: RETURN_VALUE_DISCARDED
	$PhaseOne/Entities/Fire/Firepit/Damageable.connect("health_changed", $Music, "_on_Fire_intensity_changed")
	# warning-ignore: RETURN_VALUE_DISCARDED
	$PhaseOne/Entities/Fire/Firepit/Damageable.connect("health_reached_min", self, "_on_Fire_died")
	# warning-ignore: RETURN_VALUE_DISCARDED
	$UserInterface/TheDarkNightUI/MuteButton.connect("toggled", $Music, "_on_MuteButton_toggled")


func _on_Fire_died(_origin, _value):
	print("Should move to the second phase...")
