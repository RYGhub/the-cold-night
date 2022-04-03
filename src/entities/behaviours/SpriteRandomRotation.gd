extends Sprite

var rng: RandomNumberGenerator

func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()
	self.rotate(rng.randf() * 2 * PI)
