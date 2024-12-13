extends CanvasLayer

signal back_from_options_pressed


func _on_back_button_pressed():
	back_from_options_pressed.emit()
