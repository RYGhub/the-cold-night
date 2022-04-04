extends VisibilityNotifier2D
class_name FreeWhenShapeIsOffScreen


onready var parent = get_parent()
onready var target = parent.get_parent()


func _ready():
	# This is gonna break.
	var ext = parent.shape.extents
	rect = Rect2(-ext.x, -ext.y, ext.x * 2, ext.y * 2)


func freedom():
	target.queue_free()
