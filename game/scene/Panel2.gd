extends Button


# Declare member variables here. Examples:
# var a = 2

func _pressed():
	self.visible=false
	get_tree().paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
