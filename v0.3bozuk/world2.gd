extends Node2D

class_name GameManager2





# Called when the node enters the scene tree for the first time.
func _ready():
	print(Game.door_name)
	
	# code for finding the door:
	if Game.door_name:
		var door_node = find_child(Game.door_name)
		if door_node:
			$Node2D/Player/Player.global_position = door_node.global_position
			print(door_node.global_position)
			print($Node2D/Player/Player.global_position)

