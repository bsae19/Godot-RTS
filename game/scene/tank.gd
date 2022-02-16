extends KinematicBody2D


var switch = true
onready var marker = $cible
onready var life = $vie
onready var nom = $name
var n_rot=0
const FIREBALL_SCENE = preload ("res://scene/fireball3.tscn")
var unit=[]
export var selected = false setget set_selected
signal is_selected (allier)
signal is_deselected (allier)
signal equipe (allier)
signal del_equipe (allier)
signal verife(allier,unit)
var moove = false
var Dest = Vector2()
var path = []
var walk_distance
var allier_speed = 100
var pl=true
func _on_Timer_timeout():
	if unit.size() !=0:
		if pl:
			$audio.play()
		var fireball = FIREBALL_SCENE.instance()
		get_parent().add_child(fireball)
		fireball.position=$blinder/can.get_global_position()
		var d = Vector2 ($blinder/can.get_global_position() - get_global_position())
		fireball.direction=d
		fireball.destination=fireball.position+d.normalized()*350



func _ready():
	nom.text=self.name
	nom.visible=false
	$Timer.start(2+randf())
	$Timer.connect("timeout", self, "_on_Timer_timeout")
	marker.visible=false
	life.visible = false
	connect ("is_selected", get_parent(), "select_unit")
	connect ("is_deselected", get_parent(), "deselect_unit")
	connect ("equipe", get_parent(), "equipe")
	connect ("del_equipe", get_parent(), "del_equipe")
	connect ("verife", get_parent(), "verife")
	emit_signal("equipe",self)
	pass 


func _on_tank_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_LEFT:
				if switch:
					set_selected(true)
					switch= false
				else:
					set_selected(false)
					switch=true
	pass

func set_selected(s):
	selected=s
	nom.visible=selected
	marker.visible=selected
	life.visible=selected
	if (selected):
		emit_signal("is_selected", self) 
	else:
		emit_signal("is_deselected", self)



func _process(delta):
	if unit.size()!=0:
		for u in unit:
			n_rot= self.position.angle_to_point(u.position)-2.7
		$blinder.rotation=n_rot
	if moove:
		_update_navigation_path(position,Dest)
		moove = false
	if path.size() != 0:
		walk_distance = allier_speed * delta
		moove_along_path(walk_distance)
	pass


func _update_navigation_path(start_position,end_position):
	path = get_parent().get_node("Navigation2D").get_simple_path(start_position, end_position, true)


func moove_point(destination):
	Dest=destination
	moove = true

func moove_along_path(distance):
	var last_point=position
	while path.size():
		var distance_between_points = last_point.distance_to(path[0])
		if distance <= distance_between_points:
			var new_point=last_point.linear_interpolate(path[0], distance / distance_between_points)
			var rot= position.angle_to_point(new_point)-3
			$blinder.rotation=rot
			position = new_point
			return
		distance -= distance_between_points
		last_point = path[0]
		path.remove(0)
	position = last_point


func take_damage (dam):
	life.value-=dam
	if pl:
		$audio2.play()
	if life.value <= 0:
		emit_signal("del_equipe",self)
		set_selected(false)
		get_parent().remove_child(self)
		self.queue_free()


func _on_Area2D_body_entered(body):
	emit_signal("verife",body,self)
	pass # Replace with function body.

func ajout(body):
	if not unit.has(body):
		unit.append(body)


func _on_Area2D_body_exited(body):
	if unit.has(body):
		unit.erase(body)
	pass # Replace with function body.
