extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print(Game.door_name)
	
	# code for finding the door:
	if Game.door_name:
		var door_node = find_child(Game.door_name)
		if door_node:
			$Player.global_position = door_node.global_position
			print(door_node.global_position)
			print($Player.global_position)

