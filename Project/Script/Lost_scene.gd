extends Node2D


func _ready():
	pass


func _on_MainManuButt_button_down():
	get_tree().change_scene_to(load("res://Scene/Main_Menu.tscn"))
	pass # Replace with function body.
