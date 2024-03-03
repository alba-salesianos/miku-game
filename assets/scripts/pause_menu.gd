extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void: self.hide()

var _is_paused = false:
	set = set_paused

func _unhandled_key_input(event):
	if event.is_action_pressed("pause_menu"):
		_is_paused = !_is_paused
		

func set_paused(value):
	_is_paused = value
	visible = _is_paused

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://assets/scenes/main.tscn")


func _on_quit_pressed():
	get_tree().quit()
