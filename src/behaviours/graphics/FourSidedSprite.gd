extends AnimatedSprite
class_name FourSidedSprite


const UP_LEFT = -3*PI/4
const UP_RIGHT = -PI/4
const DOWN_RIGHT = PI/4
const DOWN_LEFT = 3*PI/4


func turn(direction: Vector2) -> String:
	var angle = direction.angle()
	var anime

	if _between(UP_LEFT, angle, UP_RIGHT):
		anime = "up"
	elif _between(UP_RIGHT, angle, DOWN_RIGHT):
		anime = "right"
	elif _between(DOWN_RIGHT, angle, DOWN_LEFT):
		anime = "down"
	else:
		anime = "left"
	
	play(anime)
	return animation


func _between(m, val, x) -> bool:
	return (m < val) && (val <= x)
