extends CanvasLayer

# This will be used to notify the main scene that the start button is pressed
signal start_game


func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()


func show_game_over():
	show_message("Game Over")
	
	# Wait until the message has counted down
	await $MessageTimer.timeout
	
	$MessageLabel.text = "Dodge the \nCreeps!"
	$MessageLabel.show()
	
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)


func _on_message_timer_timeout():
	$MessageLabel.hide()


func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()
