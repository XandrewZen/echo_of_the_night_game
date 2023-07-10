extends Node2D



func _ready():
	GlobalVar.default_data()
	$Play_Button.disabled = false
	$SoundCheckBox.pressed = GlobalVar.Setting_Sound
	if GlobalVar.Setting_Sound:
		$AudioStreamPlayer.play()
	pass

#setting update
func _process(delta):
	GlobalVar.Setting_Sound = $SoundCheckBox.pressed

func _on_Play_Button_button_down():
	$AnimationPlayer.play("Play_trans" , 0.05)
	$Play_Button.disabled = true
	pass

func _changing_to_game():
	get_tree().change_scene_to(load("res://Scene/Level.tscn"))

func _on_Exit_button_down():
	get_tree().quit()
	pass


func _on_About_Button_button_down():
	get_tree().change_scene_to(preload("res://Scene/About_Scene.tscn"))
	pass # Replace with function body.


func _on_Help_Button_button_down():
	get_tree().change_scene_to(preload("res://Scene/Help_Scene.tscn"))
	pass # Replace with function body.



func _on_SoundCheckBox_toggled(button_pressed):
	if $SoundCheckBox.pressed:
		$AudioStreamPlayer.playing = true
	else:
		$AudioStreamPlayer.stop()
