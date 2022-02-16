extends KinematicBody2D
var unit=[]
var rot=0
const FIREBALL_SCENE = preload ("res://scene/fireball.tscn")
onready var life = $vie
signal enemie (enemie)
signal del_enemie ()
signal verife2(enemie,body)
var pl=true
signal sco()
func _ready():
	$tour.rotation=2
	$Timer.start(2+randf())
	$Timer.connect("timeout", self, "_on_Timer_timeout")
	connect ("enemie", get_parent(), "enemie")
	connect ("del_enemie", get_parent(), "del_enemie")
	connect ("verife2", get_parent(), "verife2")
	connect ("sco", get_parent(), "sco")
	emit_signal("enemie",self)
	pass


func _on_Timer_timeout():
	if unit.size() !=0:
		if pl:
			$audio.play()
		var fireball = FIREBALL_SCENE.instance()
		get_parent().add_child(fireball)
		fireball.position=$tour/cannon.get_global_position()
		var d = Vector2 ($tour/cannon.get_global_position() - get_global_position())
		fireball.direction=d
		fireball.destination=fireball.position+d.normalized()*1000
	pass


func _process(_delta):
	for u in unit:
		rot= self.position.angle_to_point(u.position)-1.55
	$tour.rotation=rot
	pass


func _on_Area2D_body_entered(body):
	emit_signal("verife2",body,self)
	pass


func ajout(body):
	if not unit.has(body):
		unit.append(body)
	pass


func _on_Area2D_body_exited(body):
	if unit.has(body):
		unit.erase(body)
	pass

func take_damage2 (dam):
	life.value-=dam
	emit_signal("sco")
	if pl:
		$audio2.play()
	if life.value <= 0:
		emit_signal("del_enemie",self)
		get_parent().remove_child(self)
		self.queue_free()
	pass

func chang(new):
	life.max_value=new
	life.value=new
	pass
