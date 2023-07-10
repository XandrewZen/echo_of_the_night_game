extends RigidBody2D

signal i_enemy_died

export var health = 9


func _process(delta):
	$Life_Indicator.scale = Vector2(get_1_to_3(),get_1_to_3())
	enemy_ai()
	GlobalVar.enemy_pos = global_position
	pass

func get_1_to_3():
	if health == 9 :
		return 0.5
	elif health == 8:
		return 0.5*12/13
	elif health == 7:
		return 0.5*11/13
	elif health == 6:
		return 0.5*10/13
	elif health == 5:
		return 0.5*9/13
	elif health == 4:
		return 0.5*8/13
	elif health == 3:
		return 0.5*7/13
	elif health == 2:
		return 0.5*6/13
	elif health == 1:
		return 0.5*5/13
	elif health <= 0.0:
		enemy_died()
		return 0


func enemy_ai():
	#get random call
	var random_value = rand_range(1,500)
	if random_value > 369 and random_value < 480:
		#get random direction
		var rand_range_valuex = rand_range(-1000,+1000)
		var rand_range_valuey = rand_range(-1000,+1000)
		if abs(rand_range_valuex) > 800:
			linear_velocity.x = lerp(linear_velocity.x , rand_range_valuex , 0.3)
		if abs(rand_range_valuey) > 800:
			linear_velocity.y = lerp(linear_velocity.y , rand_range_valuey , 0.3)


func enemy_died():
	#enemy death animation [reveleas that the enemy was the player all along]
	emit_signal("i_enemy_died")
	health = 9
	pass
