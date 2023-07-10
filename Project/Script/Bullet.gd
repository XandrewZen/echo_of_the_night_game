extends RigidBody2D

export var speed = 1500*2
export var rotated_angle = 0

export var can_hurt_enemy = true
export var lethal =  true
export var explosiveness = false

onready var enemy_texture = preload("res://Asset/enemy_c.png")
onready var super_bullet = preload("res://Asset/BulleytSuper.png")
onready var rock_texture = preload("res://Asset/Rock.png")

export var am_i_super = false

func _ready():
	GlobalVar.Ammo_count -= 1
	set_as_toplevel(true)
	apply_impulse(Vector2() , Vector2(speed , 0).rotated(rotated_angle))
	#$BulletCircle.self_modulate = Color(1, 0, 0.376471)
	$DestructTimer.start(rand_range(5,10))
	if GlobalVar.Ammo_count == 0:
		am_i_super = true
		GlobalVar.Ammo_count = 10
	if am_i_super:
		$BulletCircle.texture = super_bullet
		$BulletCircle.modulate = Color(0, 1, 0.976471)
		$BulletCircle.scale = Vector2(0.15,0.15)
		$FireParticles2D.modulate = Color(0, 1, 0.976471)
		$FireParticles2D.emission_sphere_radius = 28
		$CollisionShape2D.disabled = true
	$BulletParticle.emitting = true
	$BulletCircle.scale = $BulletCircle.scale * 1.25



func _on_DestructTimer_timeout():
	$BulletCircle.self_modulate = Color(1,1,1)
	mode = RigidBody2D.MODE_STATIC
	can_hurt_enemy=false
	lethal = false
	if not explosiveness:
		#modulate=Color8(0,0,0,255)
		$AnimationPlayer.stop()
		$BulletCircle.texture = rock_texture
		$CheckArea2D/CollisionShape2D.disabled = true
	if am_i_super:
		queue_free()
	if explosiveness:
		$CheckArea2D/Aura.visible = true
	$FireParticles2D.emitting = false
	#$BulletCircle.scale = $BulletCircle.scale*3
	pass # Replace with function body.



func _on_CheckArea2D_body_entered(body):
	if body.is_in_group("player"):
		if lethal:
			body.get_hit()
		if explosiveness:
			body.get_hit()
	if body.is_in_group("enemy"):
		if mode != RigidBody2D.MODE_STATIC:
			$BulletCircle.texture = enemy_texture
			$AnimationPlayer.stop()
		$BulletCircle.visible = true
		$BulletCircle.scale = Vector2(0.063 , 0.063)
		if can_hurt_enemy:
			body.health -= 1
			can_hurt_enemy = false
		explosiveness = true
		if am_i_super:
			body.health -= 3
	pass # Replace with function body.
