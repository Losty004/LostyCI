extends CharacterBody2D

const EnemyRun = 200
const gravedad = 98
func _readu():
	velocity.x = EnemyRun
	$AnimatedSprite2D.play("uwu")
	
func _physics_process(delta):
	velocity.y += gravedad
	
	if is_on_wall():
		if !$AnimatedSprite2D.flip_h:
			velocity.x = -EnemyRun
		else:
			velocity.x = -EnemyRun
			
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = true
	
	
	move_and_slide()
