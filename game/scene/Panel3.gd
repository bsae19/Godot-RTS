extends Panel


# Called when the node enters the scene tree for the first time.
func _process(_delta):
	rect_size=OS.window_size
	var chang=rect_size.y
	rect_position=Vector2(0,-chang)
	$tan.rect_size=OS.window_size
	$tan.rect_position=Vector2(0,0)
	$titre.rect_size.x=OS.window_size.x/4
	$titre.rect_size.y=OS.window_size.y/10
	var tal=$reg.rect_size.x/2
	
	$reg.rect_size.y=OS.window_size.y/10
	$reg.rect_size.x=OS.window_size.x/3.5
	$reg/regle.rect_size.y=OS.window_size.y/8
	$reg/regle.rect_size.x=OS.window_size.x/3.5
	var chang2=OS.window_size.x/2-$reg.rect_size.x/2
	chang=OS.window_size.y/4
	var tal2=$reg.rect_size.y/1.5
	$reg/regle.rect_position=Vector2(-tal,-tal2)
	$reg.rect_position=Vector2(chang2,chang)
	
	$commande.rect_size.y=OS.window_size.y/10
	$commande.rect_size.x=OS.window_size.x/3.5
	$commande/com.rect_size.y=OS.window_size.y/8
	$commande/com.rect_size.x=OS.window_size.x/3.5
	chang=OS.window_size.y/10*4
	$commande/com.rect_position=Vector2(-tal,-tal2)
	$commande.rect_position=Vector2(chang2,chang)
	
	$menu_principale.rect_size.y=OS.window_size.y/10
	$menu_principale.rect_size.x=OS.window_size.x/3.5
	$menu_principale/play2.rect_size.y=OS.window_size.y/8
	$menu_principale/play2.rect_size.x=OS.window_size.x/3.5
	chang=OS.window_size.y/100*55
	$menu_principale/play2.rect_position=Vector2(-tal,-tal2)
	$menu_principale.rect_position=Vector2(chang2,chang)
	
	$quit.rect_size.y=OS.window_size.y/10
	$quit.rect_size.x=OS.window_size.x/3.5
	$quit/quitter.rect_size.y=OS.window_size.y/8
	$quit/quitter.rect_size.x=OS.window_size.x/3.5
	chang=OS.window_size.y/10*7
	$quit/quitter.rect_position=Vector2(-tal,-tal2)
	$quit.rect_position=Vector2(chang2,chang)
	pass # Replace with function body.

func _ready():
	self.visible=false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
