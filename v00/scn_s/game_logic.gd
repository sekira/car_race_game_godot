extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var bg_speed = Vector2(0,0)
var bg_re_pos = Vector2(400,-1197)
var bg_pos = Vector2()
var bg2_pos = Vector2()
var side_speed = Vector2(1.5,0)
var game_pause = true
var pause_cond = true

var hud_speed = 0
var points = 0
var health = 100

var vivod = 'text'
var inf = 'text'

var traf_line = 0
var car_type = 0

var trafic_1 
var trafic_2 

var traf_x_1 = Vector2(0,-70)
var traf_x_2 = Vector2(0,-70)

# Called when the node enters the scene tree for the first time.
func randmiser():
	var rnd = RandomNumberGenerator.new()
	rnd.randomize()
	rnd.randomize()
	traf_line = rnd.randi_range(1, 4)
	car_type = rnd.randi_range(1, 3)
	
	if traf_line == 1:
			traf_x_1.x = 277
	if traf_line == 2:
			traf_x_1.x = 363
	if traf_line == 3:
			traf_x_1.x = 471
	if traf_line == 4:
			traf_x_1.x = 553
	
	if car_type == 1:
		get_node("fura").position =  traf_x_1
	if car_type == 2:
		get_node("musle_car").position =  traf_x_1
	if car_type == 3:
		get_node("rancher1").position =  traf_x_1
	
	
	

func _ready():
	randmiser()
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
		bg_pos = bg_pos + bg_speed
		get_node("road").position = bg_pos
		if bg_pos.y > 1200:
			get_node("road").position = bg_re_pos
			
		bg2_pos = get_node("road2").position
		bg2_pos = bg2_pos + bg_speed
		get_node("road2").position = bg2_pos
		if bg2_pos.y > 1200:
			get_node("road2").position = bg_re_pos
		
		if points < 30:
			if bg_speed.y < 4:
				bg_speed.y = bg_speed.y + 0.01
		
		if Input.is_action_pressed("car_left"):
			get_node("red_car").position = get_node("red_car").position - side_speed
		
		if Input.is_action_pressed("car_right"):
			get_node("red_car").position = get_node("red_car").position + side_speed
		
		if get_node("red_car").position.x > 616:
			health = health - 0.1
			get_node("red_car").position.x = 613
		
		if get_node("red_car").position.x < 209:
			health = health - 0.1
			get_node("red_car").position.x = 212
			
		get_node("fura").position.y = get_node("fura").position.y + 2
		get_node("musle_car").position.y = get_node("musle_car").position.y + 2
		get_node("rancher1").position.y = get_node("rancher1").position.y + 2
		
		vivod = 'speed = ' + str(int(bg_speed.y * 20)) + ' km/h\ndodge = ' + str(points) + '\nauto health = ' + str(health)
		inf = '\n\nline = ' + str(traf_line) +  '\ncar_tipe = ' + str(car_type)
		get_node("RichTextLabel").text = vivod + inf
	pass
