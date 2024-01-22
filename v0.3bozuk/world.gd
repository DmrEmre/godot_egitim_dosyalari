extends Node2D

class_name GameManager

signal toggle_game_paused(is_paused : bool)

var game_paused : bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		get_tree().paused = game_paused
		emit_signal("toggle_game_paused", game_paused)

func _input(event : InputEvent):
	if(event.is_action_pressed("ui_cancel")):
		#var current_value : bool =get_tree().paused
		#get_tree().paused = !current_value
		game_paused = !game_paused
		

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

