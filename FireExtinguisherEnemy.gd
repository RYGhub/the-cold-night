extends KinematicBody2D
class_name FireExtinguisherEnemy


func _ready():
	$AttractedToMovement.goal = get_tree().root.find_node("*/Fire")

