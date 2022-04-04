extends Button
class_name MuteButton


export(Texture) var on_sprite
export(Texture) var off_sprite


func _on_MuteButton_toggled(button_pressed):
	$Sprite.texture = on_sprite if button_pressed else off_sprite
