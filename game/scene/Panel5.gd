extends Panel


# Called when the node enters the scene tree for the first time.
func _process(_delta):
	rect_size=OS.window_size
	var chang=rect_size.y
	rect_position=Vector2(0,-chang)
	$tan.rect_size=OS.window_size
	$tan.rect_position=Vector2(0,0)
	$titre.rect_size.y=OS.window_size.y/6
	$titre.rect_size.x=OS.window_size.x/4
	var tal=OS.window_size.y/8
	$titre.rect_position=Vector2(0,tal)
	
	$jou.rect_size.y=OS.window_size.y/10
	$jou.rect_size.x=OS.window_size.x/3.5
	$jou/Label.rect_size.y=OS.window_size.y/8
	$jou/Label.rect_size.x=OS.window_size.x/3.5
	var chang2=OS.window_size.x/2-$jou.rect_size.x/2
	chang=OS.window_size.y/4
	tal=$jou.rect_size.x/2
	var tal2=$jou.rect_size.y/1.5
	$jou/Label.rect_position=Vector2(-tal,-tal2)
	$jou.rect_position=Vector2(chang2,chang)
	
	$commande.rect_size.y=OS.window_size.y/10
	$commande.rect_size.x=OS.window_size.x/3.5
	$commande/Label.rect_size.y=OS.window_size.y/8
	$commande/Label.rect_size.x=OS.window_size.x/3.5
	chang=OS.window_size.y/100*55
	$commande/Label.rect_position=Vector2(-tal,-tal2)
	$commande.rect_position=Vector2(chang2,chang)
	
	$regle.rect_size.y=OS.window_size.y/10
	$regle.rect_size.x=OS.window_size.x/3.5
	$regle/Label.rect_size.y=OS.window_size.y/8
	$regle/Label.rect_size.x=OS.window_size.x/3.5
	chang=OS.window_size.y/10*7
	$regle/Label.rect_position=Vector2(-tal,-tal2)
	$regle.rect_position=Vector2(chang2,chang)
	
	$quit.rect_size.y=OS.window_size.y/10
	$quit.rect_size.x=OS.window_size.x/3.5
	$quit/Label.rect_size.y=OS.window_size.y/8
	$quit/Label.rect_size.x=OS.window_size.x/3.5
	chang=OS.window_size.y/100*85
	$quit/Label.rect_position=Vector2(-tal,-tal2)
	$quit.rect_position=Vector2(chang2,chang)
	
	$dificulte.rect_size.y=OS.window_size.y/10
	$dificulte.rect_size.x=OS.window_size.x/3.5
	$dificulte/Label.rect_size.y=OS.window_size.y/8
	$dificulte/Label.rect_size.x=OS.window_size.x/3.5
	chang=OS.window_size.y/10*4
	$dificulte/Label.rect_position=Vector2(-tal,-tal2)
	$dificulte.rect_position=Vector2(chang2,chang)
	
	$CV.rect_position=Vector2(0,0)
	$CV.rect_size=Vector2(180,15)
	
	$tan.rect_position=Vector2(0,0)
	$dificult.rect_size.y=OS.window_size.y/5
	$dificult.rect_size.x=OS.window_size.x/4
	tal=OS.window_size.x-$dificult.rect_size.x*1.55
	tal2=OS.window_size.y/10
	$dificult.rect_position=Vector2(tal,-tal2)
	
	pass # Replace with function body.

func _ready():
	self.visible=true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_jou_pressed():
	self.visible=false
	get_tree().paused = false
	pass # Replace with function body.





