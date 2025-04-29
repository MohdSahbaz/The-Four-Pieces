extends Control

func _ready():
	$"Buttons/VBoxContainer/Main Menu".grab_focus()


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/StartGame/StartGame.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
