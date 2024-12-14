extends Node

# https://docs.godotengine.org/en/stable/tutorials/io/background_loading.html
#TODO: https://docs.godotengine.org/en/stable/tutorials/scripting/pausing_games.html 

var start_scene
var options_scene	
var pause_scene

## TODO: create independent btns which can be resued in all scenes !

func _ready():
	options_scene = get_node("options_scene")
	options_scene.back_from_options_pressed.connect(back_from_option)
	
	pause_scene = get_node("pause_scene")
	pause_scene.continue_pressed.connect(continue_game)
	pause_scene.show_options_pressed.connect(show_options)
		
	start_scene = get_node("start_scene")
	start_scene.start_game_pressed.connect(start_game)
	start_scene.options_pressed.connect(show_options)
	

func start_game():
	print("game started")	
	var main_scene = ResourceLoader.load("res://main_scene/main_scene.tscn")	
	var main = main_scene.instantiate()
	add_child(main)
	move_child(main,0)

	start_scene.visible = false 
	start_scene.queue_free()

func continue_game():
	pause_scene.visible = false

func show_options():
	if(start_scene!=null):
		start_scene.visible = false 
	pause_scene.visible = false
	options_scene.visible = true

func show_pause_menu():
	pause_scene.visible = true

func back_from_option():
	if(start_scene!=null):
		start_scene.visible = true
	if(!pause_scene.visible and start_scene==null):
		pause_scene.visible = true
	options_scene.visible = false

func _input(event):
	#TODO: change it to an UI btn so it doen't close the full screen
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			if(start_scene==null and !options_scene.visible):
				pause_scene.visible = !pause_scene.visible

func _on_options_scene_back_from_options_pressed():
	pass # Replace with function body.
