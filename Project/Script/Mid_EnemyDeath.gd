extends Node2D


func to_gameover():
	get_tree().change_scene_to(preload("res://Scene/Lost_scene.tscn"))
	pass
