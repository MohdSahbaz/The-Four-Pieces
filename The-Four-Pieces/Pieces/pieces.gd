extends Area3D

func _ready():
	add_to_group("collectible")

func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		body.collect_piece()
		queue_free()
