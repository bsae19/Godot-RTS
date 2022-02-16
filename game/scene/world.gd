extends Node2D

var selected_units = []
var world = Vector2(0,0)
var mouse_position = Vector2(0,0)
var is_mouse=false

var equip=[]
var enemi=[]
var buttons= []
var new_button =preload("res://scene/Button.tscn")
var play=false
var pause=false
var test=false
var tmp_s=0
var tmp_m=0
var score=300
func select_unit (unit):
	if not selected_units.has(unit):
		selected_units.append(unit)
	print ("on a selectionner l'uniter : %s" % unit.name)
	create_button()

func deselect_unit (unit):
	if selected_units.has(unit):
		selected_units.erase(unit)
	print ("on a deselectionner l'uniter : %s" % unit.name)
	create_button()

func delete_button():
	for button in buttons:
		if $UI/Base.has_node(button):
			var tmp = $UI/Base.get_node(button)
			$UI/Base.remove_child(tmp)
			tmp.queue_free()
	buttons.clear()

func create_button():
	delete_button()
	var position_button= 0
	for selected_unit in selected_units:
		if not buttons.has(selected_unit.name) :
			var button = new_button.instance()
			button.connect_button(self,selected_unit.name)
			position_button += 50
			button.rect_position=Vector2(position_button,-50)
			$UI/Base.add_child(button)
			buttons.append(button.name)



func button_clicked(nom_button):
	for button in buttons:
		if button == nom_button:
			for selected_unit in selected_units:
				if selected_unit.name == nom_button:
					selected_unit.switch=true
					selected_unit.selected = false


func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_RIGHT:
				start_move_units(get_global_mouse_position())

func start_move_units (destination):
	for u in selected_units:
		u.moove_point(destination+Vector2(randi()%50, randi()%50))

func son_pause(c):
	$eau/audio3.stream_paused=c
	$eau/audio2.stream_paused=c
	for en in enemi:
		en.pl=!c
	for eq in equip:
		eq.pl=!c

func _process(_delta):
	if not $eau/audio2.is_playing():
		$eau/audio2.play()
	if not $eau/audio3.is_playing():
		$eau/audio3.play()
	if equip.size()== 0:
		while (buttons.size()!=0):
			button_clicked(buttons[0])
		var new=(tmp_m*120+tmp_s*2)
		score+=new-2000
		var strn = "score=%d"
		var new_str = strn % [score]
		$UI/Base/fin/defaite/scr.text=new_str
		$UI/Base/fin.visible=true
		$UI/Base/fin/defaite.visible=true
		get_tree().paused = true
		son_pause(true)
	if enemi.size()== 0:
		while (buttons.size()!=0):
			button_clicked(buttons[0])
		var new=(tmp_m*600+tmp_s*10)
		score-=new+1000
		var strn = "score=%d"
		var new_str = strn % [score]
		$UI/Base/fin/victoire/scr.text=new_str
		$UI/Base/fin.visible=true
		$UI/Base/fin/victoire.visible=true
		get_tree().paused = true
		son_pause(true)
	son_pause(test)
	pass 

func verife(body,unit):
	for u in enemi:
		if u==body:
			unit.ajout(body)
		
func verife2(body,unit):
	for u in equip:
		if u==body:
			unit.ajout(body)


func _on_Button_pressed(_extra_arg_0):
	$UI/Base/menu.visible=false
	$UI/Base/rule2.visible=true
	pass # Replace with function body.

func _ready():
	$UI/son.visible=true
	$UI/son2.visible=false
	$UI/men.visible=true
	$UI/Base/fin.visible=false
	$UI/Base/fin/defaite.visible=false
	$UI/Base/fin/victoire.visible=false
	$UI/Base/fin/fuite.visible=false
	$UI/Base/rule1.visible=false
	$UI/Base/switch1.visible=false
	$UI/Base/rule2.visible=false
	$UI/Base/switch2.visible=false
	$UI/Base/dific.visible=false
	get_tree().paused = true



func _on_Button3_pressed():
	$UI/Base/menu.visible=false
	son_pause(false)
	pass # Replace with function body.

func equipe(body):
	if not equip.has(body):
		equip.append(body)

func del_equipe(body):
	if equip.has(body):
		equip.erase(body)

func enemie(body):
	if not enemi.has(body):
		enemi.append(body)

func del_enemie(body):
	if enemi.has(body):
		enemi.erase(body)

func verife3(body,dam):
	if not equip.has(body):
			body.take_damage(dam)

func verife4(body,dam):
	if not enemi.has(body):
		body.take_damage(dam)


func _on_Button5_pressed():
	$UI/Base/menu.visible=false
	$UI/Base/switch1.visible=true
	pass # Replace with function body.


func _on_retour_pressed():
	$UI/Base/menu.visible=true
	$UI/Base/switch1.visible=false
	pass # Replace with function body.


func _on_commande_pressed():
	$UI/Base/menu_principale.visible=false
	$UI/Base/switch2.visible=true
	pass # Replace with function body.
	pass # Replace with function body.


func _on_back_pressed():
	$UI/Base/menu_principale.visible=true
	$UI/Base/switch2.visible=false
	pass # Replace with function body.


func _on_back3_pressed():
	$UI/Base/menu_principale.visible=true
	$UI/Base/rule1.visible=false
	pass # Replace with function body.


func _on_regle_pressed():
	$UI/Base/menu_principale.visible=false
	$UI/Base/rule1.visible=true
	pass # Replace with function body.


func _on_son_pressed():
	if test:
		test=false
	else:
		test=true
	son_pause(test)
	$UI/son.visible=!test
	$UI/son2.visible=test
	pass # Replace with function body.


func _on_back4_pressed():
	$UI/Base/menu.visible=true
	$UI/Base/rule2.visible=false
	pass # Replace with function body.


func _on_men_pressed():
	while (buttons.size()!=0):
		button_clicked(buttons[0])
	$UI/Base/menu.visible=true
	get_tree().paused = true
	son_pause(true)
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	for equi in equip:
		if body.name==equi.name:
			while (buttons.size()!=0):
				button_clicked(buttons[0])
			$UI/Base/fin.visible=true
			$UI/Base/fin/fuite.visible=true
			get_tree().paused = true
			son_pause(true)
	pass # Replace with function body.


func _on_dificulte_pressed():
	$UI/Base/menu_principale.visible=false
	$UI/Base/dific.visible=true
	pass # Replace with function body.


func _on_back_dific_pressed():
	$UI/Base/menu_principale.visible=true
	$UI/Base/dific.visible=false
	pass # Replace with function body.


func _on_facile_pressed():
	for e in enemi:
		e.chang(800)
	score=0
	$UI/Base/menu_principale.visible=true
	$UI/Base/dific.visible=false
	$UI/Base/menu_principale/dificult.text="Dificulté:Facile"
	pass # Replace with function body.


func _on_moyen_pressed():
	for e in enemi:
		e.chang(1200)
	score=1000
	$UI/Base/menu_principale.visible=true
	$UI/Base/dific.visible=false
	$UI/Base/menu_principale/dificult.text="Dificulté:Moyen"
	pass # Replace with function body.


func _on_dificile_pressed():
	for e in enemi:
		e.chang(2100)
	score=2000
	$UI/Base/menu_principale.visible=true
	$UI/Base/dific.visible=false
	$UI/Base/menu_principale/dificult.text="Dificulté:Dificile"
	pass # Replace with function body.


func _on_temp_timeout():
	tmp_s+=1
	if tmp_s==60:
		tmp_s=0
		tmp_m+=1
	var string = "%dm:%ds"
	var new_string = string % [tmp_m, tmp_s]
	$UI/temp.text=new_string
	pass # Replace with function body.

func sco():
	score +=20


func _on_Des_pressed():
	while (buttons.size()!=0):
		button_clicked(buttons[0])
	pass # Replace with function body.
