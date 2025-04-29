extends Area3D

func _input(event):
	if event.is_action_pressed("collect_items"):
		collect_piece()

func collect_piece():
	for body in get_overlapping_bodies():
		if body.is_in_group("collectible"):
			body.queue_free()
			print("Piece collected!")
