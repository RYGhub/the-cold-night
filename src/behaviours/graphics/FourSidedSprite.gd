extends AnimatedSprite
class_name FourSidedSprite


const UP_LEFT = -3*TAU/8
const UP_RIGHT = -TAU/8
const DOWN_RIGHT = TAU/8
const DOWN_LEFT = 3*TAU/8


func turn(direction):
	var angle = direction.angle()
	var anime

	if Utils.is_between(UP_LEFT, angle, UP_RIGHT):
		anime = "up"
	elif Utils.is_between(UP_RIGHT, angle, DOWN_RIGHT):
		anime = "right"
	elif Utils.is_between(DOWN_RIGHT, angle, DOWN_LEFT):
		anime = "down"
	else:
		anime = "left"
	
	play(anime)
	return animation


func _on_AttractedToMovement_moved_in_direction(_origin, direction):
	turn(direction)


func _on_PlayerMovement_moved_in_direction(_origin, direction):
	turn(direction)
