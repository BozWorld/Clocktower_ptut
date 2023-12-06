extends Area2D

var clickable = false
signal clicked(knot_name)
@export var knot_name =""

func _process(delta):
	if Input.is_action_just_pressed("click")&&clickable==true:
		clicked.emit(knot_name)
		print("clicked")

func _on_mouse_entered():
	clickable=true
	$Sprite2D.scale=Vector2(.8,.8)


func _on_mouse_exited():
	clickable=false
	$Sprite2D.scale=Vector2(1,1)
	pass # Replace with function body.

