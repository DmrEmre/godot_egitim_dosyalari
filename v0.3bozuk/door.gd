extends Area2D

@export_file("*.tscn", "*.scn") var target_scene: String



#export var (String, FILE, "*.tscn,*.scn"): target_scene



## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("ui_accept"):
		if get_overlapping_bodies().size() > 1:
			next_level()
			
func next_level():
	var ERR = get_tree().change_scene_to_file(target_scene)
	#var ERR =get_tree().change_scene_to_file("res://world2.tscn")
	if ERR!= OK:
		print("..")
	
	Game.door_name = name
