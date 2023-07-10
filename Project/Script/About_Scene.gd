extends Node2D





func _on_MainMenuButton_button_down():
	get_tree().change_scene_to(load("res://Scene/Main_Menu.tscn"))
