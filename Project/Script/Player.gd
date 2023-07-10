extends KinematicBody2D

export var speed = 15000
onready var bulletScene = preload("res://Scene/Bullet.tscn")

func _process(delta):
	movement_code(delta)
	aiming()


func aiming():
	look_at(get_global_mouse_position())
	

func shoot():
	#shooting code
	var bullet = bulletScene.instance()
	bullet.global_position = $TurretPosition2D.global_position # Set the initial position of the bullet
	bullet.rotation_degrees = rotation_degrees
	bullet.rotated_angle = rotation
	get_tree().get_current_scene().add_child(bullet)
	$Camera2D.add_trauma(0.45)
	
	if GlobalVar.Setting_Sound:
		$AudioStreamPlayer.play()


func movement_code(delta):
	var velo = Vector2(0,0)
	
	if Input.is_action_pressed("ui_left"):
		velo.x= -1
	elif Input.is_action_pressed("ui_right"):
		velo.x= +1
	elif Input.is_action_pressed("ui_up"):
		velo.y= -1
	elif Input.is_action_pressed("ui_down"):
		velo.y= +1
	
	velo = velo.normalized() * speed * delta
	move_and_slide(velo, Vector2.UP)


func get_hit():
	GlobalVar.player_health -= 1
	
	if GlobalVar.player_health == 0:
		player_death()
	pass

func player_death():
	#enemy death animation [reveleas that the enemy was the player all along]
	get_tree().change_scene_to(preload("res://Scene/PlayerDeath.tscn"))
	pass
