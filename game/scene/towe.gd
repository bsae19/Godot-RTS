extends KinematicBody2D

onready var life=$towe/life
signal enemie (enemie)
signal del_enemie (enemie)

# Called when the node enters the scene tree for the first time.
func _ready():
	connect ("enemie", get_parent(), "enemie")
	connect ("del_enemie", get_parent(), "del_enemie")
	emit_signal("enemie",self)
	pass # Replace with function body.

func take_damage (dam):
	life.value-=dam
	if life.value <= 0:
		emit_signal("del_enemie",self)
		get_parent().remove_child(self)
		self.queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_tower_body_entered(body):
	pass # Replace with function body.
