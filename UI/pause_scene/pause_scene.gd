extends Control

signal show_options_pressed
signal continue_pressed

func _on_back_to_game_button_button_down():
	continue_pressed.emit()

func _on_options_button_button_down():
	show_options_pressed.emit()
