extends Control

func _ready() -> void: self.hide()

var _is_paused = false:
	set = set_paused

func _unhandled_key_input(event):
	if event.is_action_pressed("pause_menu"):
		if not get_node("/root/Main/HUD/FinishMenu").is_visible_in_tree():
			_is_paused = !_is_paused
		

func set_paused(value):
	_is_paused = value
	visible = _is_paused

func _on_restart_pressed():
	get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().quit()
