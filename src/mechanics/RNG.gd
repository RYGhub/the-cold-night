extends Node
class_name RNG


var rng: RandomNumberGenerator


func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()
