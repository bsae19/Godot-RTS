extends LinkButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _pressed():
	OS.shell_open("http://bocal.cs.univ-paris8.fr/~bsaesil/m2e-L1/#CV")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
