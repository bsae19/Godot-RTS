extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	var chang=0
	var chang2=OS.window_size.x-rect_size.x
	var tal2=(OS.window_size.y/100)*10
	var tal=OS.window_size.x/100*(100/15)
	rect_size=Vector2(tal,tal2)
	rect_position=Vector2(chang2,chang)
	var chang3=rect_size.y
	tal2=(OS.window_size.y/100)*10
	$retour.rect_position=Vector2(0,chang3)
	$retour.rect_size=Vector2(tal,tal2)
