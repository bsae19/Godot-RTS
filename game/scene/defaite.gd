extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(_delta):
	rect_size=OS.window_size
	rect_position=Vector2(0,0)
	
	$men.rect_size.y=OS.window_size.y/10
	$men.rect_size.x=OS.window_size.x/3.5
	$men/menu_principale.rect_size.y=OS.window_size.y/8
	$men/menu_principale.rect_size.x=OS.window_size.x/3.5
	var chang2=OS.window_size.x/10
	var chang=OS.window_size.y/10*6.5
	var tal2=$men.rect_size.y/1.5
	var tal=$men.rect_size.x/2
	$men/menu_principale.rect_position=Vector2(-tal,-tal2)
	$men.rect_position=Vector2(chang2,chang)
	
	$quitter.rect_size.y=OS.window_size.y/10
	$quitter.rect_size.x=OS.window_size.x/3.5
	$quitter/quit.rect_size.y=OS.window_size.y/8
	$quitter/quit.rect_size.x=OS.window_size.x/3.5
	chang2=OS.window_size.x/10*9-$quitter.rect_size.x
	chang=OS.window_size.y/10*6.5
	tal2=$quitter.rect_size.y/1.5
	tal=$quitter.rect_size.x/2
	$quitter/quit.rect_position=Vector2(-tal,-tal2)
	$quitter.rect_position=Vector2(chang2,chang)
	
	$scr.rect_size.x=OS.window_size.x/8
	$scr.rect_size.y=OS.window_size.y/12
	chang2=OS.window_size.x/2-$scr.rect_size.x
	chang=OS.window_size.y/7*3
	$scr.rect_position=Vector2(chang2,chang)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
