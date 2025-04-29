extends Control

func _ready():
	$Buttons/VBoxContainer/Retry.grab_focus()


func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://Main.tscn")

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/StartGame/StartGame.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
