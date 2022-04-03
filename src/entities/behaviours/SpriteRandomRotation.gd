extends Sprite

var rng : RandomNumberGenerator = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	self.rotate(rng.randf_range(0,360))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
