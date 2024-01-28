extends Node2D	

func new_game():
	get_tree().call_group("mobs", "queue_free")
	%Player.start()
	%HUD.hide_button()
	%HUD.show_message("Shoot Nigga, SHOOT")
	await get_tree().create_timer(1.0).timeout
	%HUD.hide()
	_on_timer_timeout()

	
func spawn_mob():
	$MobTimer.start()
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func _on_timer_timeout():
	spawn_mob()
	
func _on_player_health_depleted():
	$MobTimer.stop()
	%HUD.game_over()
	
