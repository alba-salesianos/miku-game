extends Node2D

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.has_method("GetNote"):
		$note_sfx.play()
		await get_tree().create_timer(0.05).timeout
		body.GetNote()
		queue_free()
		
		var notes = get_tree().get_nodes_in_group("Notes")
		if notes.size() == 1:
			Events.level_completed.emit()
			
