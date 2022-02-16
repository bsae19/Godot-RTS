extends TextureButton

onready var label = $Label
signal button_clicked

func _pressed():
	emit_signal("button_clicked")
	
func connect_button(object,nom):
	self.name = nom
	$Label.text = nom
	connect("button_clicked", object, "button_clicked", [self.name])
	
