extends Control



func _input(_event):
	if Input.is_action_pressed("echap"):
		get_tree().paused = false
		if $menu.visible:
			$menu.visible=false
		if $switch1.visible:
			$switch1.visible=false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
