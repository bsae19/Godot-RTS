extends Area2D

var speed = 20;
var direction = Vector2(1,0) setget set_direction
var destination = Vector2(200,0) setget set_destination

func  set_direction (d):
	direction=d

func set_destination (d):
	destination=d

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (position - destination).length() > 10:
		position= position + direction *speed*delta
		#print ("position : ", position, ", destination : ", destination)
	else:
		get_parent().remove_child(self)
		self.queue_free()
	#position=position +Vector2(1,1)*speed*delta




func _on_fireball_body_entered(body):
	if body.has_method("take_damage2"):
		destination=position
		body.take_damage2(100)
	pass # Replace with function body.
