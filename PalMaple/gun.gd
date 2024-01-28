extends Area2D


func _physics_process(delta):
	# the reason for large colision area is because the bullet 
	# needs to travel within the range to kills or eliminate the enemies
	# get the enemies in range of the colision area by finding the enemies in range
	var enemies_in_range = get_overlapping_bodies()
	# if there are at least one enemy in range 
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)

func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)	 
	
func _on_timer_timeout():
	shoot()
