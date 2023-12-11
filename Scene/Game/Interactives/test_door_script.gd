extends Area2D

var clickable = false
var base_size
signal door_clicked(object)
@export var door_reference =""

# processing ###################
func _ready():
	base_size = $Sprite2D.scale
	connect("mouse_entered",_on_hovered)
	connect("mouse_exited",_stop_hovering)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_interact_with_door()

func _interact_with_door():
	if Input.is_action_just_pressed("click")&&clickable==true:
		print("door clicked")
		door_clicked.emit(door_reference)

func _on_hovered():
	clickable=true
	$Sprite2D.scale=base_size*0.8

func _stop_hovering():
	clickable=false
	$Sprite2D.scale=base_size
