extends CanvasLayer

signal start_game_pressed
signal options_pressed


func _on_start_game_button_pressed():
	start_game_pressed.emit()


func _on_options_button_pressed():
	options_pressed.emit()
