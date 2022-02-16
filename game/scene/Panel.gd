extends Panel


# Called when the node enters the scene tree for the first time.
func _process(_delta):
	rect_size=OS.window_size
	var chang=rect_size.y
	rect_position=Vector2(0,-chang)
	var chang2=OS.window_size.y/10
	var chang3=OS.window_size.x/3
	$tan.rect_size=OS.window_size
	$tan.rect_position=Vector2(0,0)
	$touche.rect_size=Vector2(chang3,chang2)
	$clique_droit.rect_size=Vector2(chang3,chang2)
	$clique_gauche.rect_size=Vector2(chang3,chang2)
	$molette.rect_size=Vector2(chang3,chang2)
	$ctrl.rect_size=Vector2(chang3,chang2)
	var tal=OS.window_size.x/2
	var tal2=OS.window_size.y/8
	$touche.rect_position=Vector2(tal,tal2)
	tal2=OS.window_size.y/8*3
	$clique_droit.rect_position=Vector2(tal,tal2)
	tal2=OS.window_size.y/8*5
	$clique_gauche.rect_position=Vector2(tal,tal2)
	tal2=OS.window_size.y/8*7
	$molette.rect_position=Vector2(tal,tal2)
	$ctrl.rect_position=Vector2(tal,0)
	
	$tou.rect_size.x=OS.window_size.x/6
	$tou.rect_size.y=OS.window_size.y/4
	$tou.rect_position.y=0
	$tou.rect_position.x=OS.window_size.x/100*20
	
	$click_l.rect_size.x=OS.window_size.x/6
	$click_l.rect_size.y=OS.window_size.y/4
	$click_l.rect_position.y=OS.window_size.y/4
	$click_l.rect_position.x=OS.window_size.x/100*20
	
	$click_r.rect_size.x=OS.window_size.x/6
	$click_r.rect_size.y=OS.window_size.y/4
	$click_r.rect_position.y=OS.window_size.y/4*2
	$click_r.rect_position.x=OS.window_size.x/100*20
	
	$mol.rect_size.x=OS.window_size.x/6
	$mol.rect_size.y=OS.window_size.y/4
	$mol.rect_position.y=OS.window_size.y/4*3
	$mol.rect_position.x=OS.window_size.x/100*20
	
	pass # Replace with function body.

func _ready():
	self.visible=false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
