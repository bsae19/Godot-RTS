extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(_delta):
	var tal=OS.window_size.x/5
	var tal2=OS.window_size.y/5
	rect_position=Vector2(0,0)
	rect_size=Vector2(tal,tal2)
