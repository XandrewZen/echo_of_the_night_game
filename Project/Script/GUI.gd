extends CanvasLayer

func _process(delta):
	update_gui()

func update_gui():
	$Player_hEALTH.value = GlobalVar.player_health * 10.00
	pass


func _on_Enemy_i_enemy_died():
	$AnimationPlayer.current_animation = "Enemy_death"
	pass
