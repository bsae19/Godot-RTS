extends Node2D

export var speed=15
export(float) var character_speed = 400.0
var path = []
var pos

func _ready():
	pos=1782
	pass



func _process(delta):
	if position.x>-256:
		position.x = lerp(position.x, position.x - speed, speed*delta)
	else:
		position.x =pos

