extends Area2D

var base_cursor = load("res://Assets/Visuel/raw/light2d.png")
var interact_cursor = load("res://Assets/Visuel/raw/img_square.png")
signal hov

func _ready():
	pass

func _process(delta):
	position= get_global_mouse_position()
	
func _hovered():
	print("coucou")
	$Sprite2D.texture = interact_cursor
	$Sprite2D.scale = Vector2(1,1)
	pass

func _not_hovered():
	$Sprite2D.texture = base_cursor
	$Sprite2D.scale = Vector2(.1,.1)
	pass
