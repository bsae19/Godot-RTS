extends Camera2D

export var speed=15
export var zoom_speed =20
var mousepos=Vector2()
var mouse_speed=15
var zoom_factor =1.0
var is_zooming =false
var marginX=(OS.window_size.x*0.1)
var marginY=(OS.window_size.y*0.1)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_x = (int(Input.is_action_pressed("ui_right")) 
	- int(Input.is_action_pressed("ui_left")))
	var input_y = (int(Input.is_action_pressed("ui_down")) 
	- int (Input.is_action_pressed("ui_up")))
	
	position.x = lerp(position.x, position.x + input_x * speed, speed*delta*zoom.x)
	position.y = lerp(position.y, position.y + input_y * speed, speed*delta*zoom.y)
	
	zoom.x = lerp (zoom.x,zoom.x* zoom_factor,zoom_speed * delta)
	zoom.y = lerp (zoom.y,zoom.y* zoom_factor,zoom_speed * delta)
	zoom.x=clamp(zoom.x,1,4)
	zoom.y=clamp(zoom.y,1,4)
	if !is_zooming:
		zoom_factor =1.0
	if Input.is_action_pressed("ctrl"):
		if mousepos.x < marginX:
			position.x = lerp(position.x, position.x - abs(mousepos.x - marginX)/marginX * mouse_speed * zoom.x, mouse_speed * delta)
		elif mousepos.x > OS.window_size.x - marginX:
			position.x = lerp(position.x, position.x + abs(mousepos.x - OS.window_size.x + marginX)/marginX *  mouse_speed * zoom.x, mouse_speed * delta)
		if mousepos.y < marginY:
			position.y = lerp(position.y, position.y - abs(mousepos.y - marginY)/marginY * mouse_speed * zoom.y, mouse_speed * delta)
		elif mousepos.y > OS.window_size.y - marginY:
			position.y = lerp(position.y, position.y + abs(mousepos.y - OS.window_size.y + marginY)/marginY * mouse_speed * zoom.y, mouse_speed * delta)
	
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			is_zooming= true
			if event.button_index == BUTTON_WHEEL_UP:
				zoom_factor -= 0.01 * zoom_speed
			if event.button_index == BUTTON_WHEEL_DOWN:
				zoom_factor += 0.01 * zoom_speed
		else:
			is_zooming = false
	if event is InputEventMouse:
		mousepos = event.position



