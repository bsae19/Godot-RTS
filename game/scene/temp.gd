extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	var tal2=(OS.window_size.y/100)*10
	var tal=OS.window_size.x/150
	rect_size=Vector2(tal,tal2)
	var chang=OS.window_size.x-rect_size.x*4
	var chang2=-rect_size.y/2
	rect_position=Vector2(chang,chang2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
