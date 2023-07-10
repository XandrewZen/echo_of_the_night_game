extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if GlobalVar.Setting_Sound:
		$BG_player.play()
	pass

func exchange():
	get_tree().change_scene_to(preload("res://Scene/Mid_EnemyDeath.tscn"))
	pass
