extends Control

@export var world : GameManager



signal pause_about_to_show()


@onready var save_game = $SaveGame
@onready var load_game = $LoadGame

var _image_for_save: Image






# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	world.connect("toggle_game_paused", _on_world_toggle_game_paused)


func _on_world_toggle_game_paused(is_paused : bool):
	if(is_paused):
		show()
	else:
		hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	pass



func _on_resume_btn_pressed():
	world.game_paused = false
	_image_for_save = null
	hide()
	get_tree().paused = false
	process_mode = Node.PROCESS_MODE_PAUSABLE
	visible = false



func _on_save_btn_pressed():
	save_game.show_save_dlg(_image_for_save)


func _on_load_btn_pressed():
	load_game.show_modal()


func _on_main_menu_btn_pressed():
	#get_tree().change_scene_to_file("res://main.tscn")
	get_tree().quit()


func _show() -> void:
	_image_for_save = _get_screenshot()
	emit_signal("pause_about_to_show")
	process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = true
	visible = true
	show()

func _input(event):
	if !event.is_action("pause") or event.is_echo() or !event.is_pressed():
		return
	if visible:
		_on_resume_btn_pressed()
	else:
		_show()


func _get_screenshot() -> Image:
	var image = get_viewport().get_texture().get_image()
	return image
