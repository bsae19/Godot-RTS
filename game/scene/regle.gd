extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(_delta):
	$tan.rect_size=OS.window_size
	$tan.rect_position=Vector2(0,0)
	rect_size=OS.window_size
	var chang=rect_size.y
	rect_position=Vector2(0,-chang)
	var chang2=OS.window_size.x/2-($text.rect_size.x/1.5)
	chang=OS.window_size.y/2-($text.rect_size.y/2)
	$text.rect_position=Vector2(chang2,chang)
	$titre.rect_size.x=OS.window_size.x/3
	$titre.rect_size.y=OS.window_size.y/12
	$titre.rect_position.x=0
	$titre.rect_position.y=OS.window_size.y/12
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
