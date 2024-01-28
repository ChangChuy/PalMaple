extends CanvasLayer

signal start_game

func show_message(text):
	%Message.text = text
	%Message.show()

func game_over(): 
	show()
	await show_message("Game Over")
	await get_tree().create_timer(1.0).timeout
	$RestartButton.show()
	
func _on_message_timer_timeout():
	%Message.hide()

func _on_restart_button_pressed():
	$RestartButton.hide()
	start_game.emit()

func hide_button():
	$RestartButton.hide()
	
