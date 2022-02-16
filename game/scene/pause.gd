extends Label

func _ready():
	rect_size.x=OS.window_size.x/10

func _process(_delta):
	rect_position.x=OS.window_size.x-rect_size.x*1.5
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
