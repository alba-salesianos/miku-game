extends CanvasLayer

@onready var finished_menu = $FinishMenu
var notes_collected = 0

func _ready():
	Events.level_completed.connect(show_finish_screen)
	

func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	$Score.text = "Notas: " + str(notes_collected)
	notes_collected = notes_collected + 1
	
func show_finish_screen():
	finished_menu.show()
