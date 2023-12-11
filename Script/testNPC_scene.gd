extends Area2D

var clickable = false
var base_size
signal clicked(object)
@export var knot_reference =""

#Processing ################################################
func _ready():
	base_size=$Sprite2D.scale
	connect("mouse_entered",_on_hovered)
	connect("mouse_exited",_stop_hovering)

func _process(delta):
	_interact_with()

#Methods ################################################
func _interact_with():
	if Input.is_action_just_pressed("click")&&clickable==true:
		print("clicked")
		clicked.emit(knot_reference)

#Receivers ################################################
func _on_hovered():
	clickable=true
	$Sprite2D.scale=base_size*0.8

func _stop_hovering():
	clickable=false
	$Sprite2D.scale=base_size
	pass # Replace with function body.

