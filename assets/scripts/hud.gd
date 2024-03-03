extends CanvasLayer

var notes_collected = 0


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	$Score.text = "Notas: " + str(notes_collected)
	notes_collected = notes_collected + 1
	
