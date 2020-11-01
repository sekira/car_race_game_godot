extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var bg_sdeed = Vector2(0,4)
var bg_re_pos = Vector2(400,-1198)
var bg_pos = Vector2()
var bg2_pos = Vector2()
var side_speed = Vector2(1,0)
var game_pause = true
var pause_cond = true


var vivod = 'text'

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_pause == true:
		pause_cond = get_node("pause").visible
		if Input.is_action_just_released("pause"):
			game_pause = false
			get_node("pause").visible = game_pause
			pause_cond = get_node("pause").visible
			print(pause_cond)
		if Input.is_action_just_released("close"):
			get_tree().quit()
	else:
		pause_cond = get_node("pause").visible
		#print("pause == false")
		if Input.is_action_just_released("pause"):
			game_pause = true
			get_node("pause").visible = game_pause
			pause_cond = get_node("pause").visible
			#print(pause_cond)
		bg_pos = get_node("road").position
		bg_pos = bg_pos + bg_sdeed
		get_node("road").position = bg_pos
		if bg_pos.y > 1200:
			get_node("road").position = bg_re_pos
			
		bg2_pos = get_node("road2").position
		bg2_pos = bg2_pos + bg_sdeed
		get_node("road2").position = bg2_pos
		if bg2_pos.y > 1200:
			get_node("road2").position = bg_re_pos
			
		vivod = 'road_y = ' + str(get_node("road").position.y) + '\nroad2_y = ' + str(get_node("road2").position.y) + '\nbg-pos = ' + str(bg_pos) + '\nbg2-pos = ' + str(bg2_pos)
		get_node("RichTextLabel").text = vivod
	pass
