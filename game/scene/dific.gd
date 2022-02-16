extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	rect_size=OS.window_size
	var chang=rect_size.y
	rect_position=Vector2(0,-chang)
	$tan.rect_size=OS.window_size
	$tan.rect_position=Vector2(0,0)
	$titre.rect_size.y=OS.window_size.y/100*2
	$titre.rect_size.x=OS.window_size.x/4
	var tal=OS.window_size.y/8
	$titre.rect_position=Vector2(0,tal)
	
	$facile.rect_size.y=OS.window_size.y/10
	$facile.rect_size.x=OS.window_size.x/3.5
	$facile/Label.rect_size.y=OS.window_size.y/8
	$facile/Label.rect_size.x=OS.window_size.x/3.5
	var chang2=OS.window_size.x/2-$facile.rect_size.x/2
	chang=OS.window_size.y/4
	tal=$facile.rect_size.x/2
	var tal2=$facile.rect_size.y/1.5
	$facile/Label.rect_position=Vector2(-tal,-tal2)
	$facile.rect_position=Vector2(chang2,chang)
	
	$moyen.rect_size.y=OS.window_size.y/10
	$moyen.rect_size.x=OS.window_size.x/3.5
	$moyen/Label.rect_size.y=OS.window_size.y/8
	$moyen/Label.rect_size.x=OS.window_size.x/3.5
	chang2=OS.window_size.x/2-$moyen.rect_size.x/2
	chang=OS.window_size.y/100*50
	tal=$moyen.rect_size.x/2
	tal2=$moyen.rect_size.y/1.5
	$moyen/Label.rect_position=Vector2(-tal,-tal2)
	$moyen.rect_position=Vector2(chang2,chang)
	
	$dificile.rect_size.y=OS.window_size.y/10
	$dificile.rect_size.x=OS.window_size.x/3.5
	$dificile/Label.rect_size.y=OS.window_size.y/8
	$dificile/Label.rect_size.x=OS.window_size.x/3.5
	chang2=OS.window_size.x/2-$dificile.rect_size.x/2
	chang=OS.window_size.y/100*75
	tal=$dificile.rect_size.x/2
	tal2=$dificile.rect_size.y/1.5
	$dificile/Label.rect_position=Vector2(-tal,-tal2)
	$dificile.rect_position=Vector2(chang2,chang)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
