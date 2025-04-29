extends Control

func _ready():
	$Buttons/VBoxContainer/Back.grab_focus()

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/StartGame/StartGame.tscn")
