extends Area2D
var clickpos
var base_cursor = load("res://Assets/Visuel/raw/light2d.png")
var interact_cursor = load("res://Assets/Visuel/raw/img_square.png")
signal hov

func _ready():
	pass

func _process(delta):
	clickpos =$"../SubViewportContainer/SubViewport".get_mouse_position()
	position= clickpos

func _hovered():
	print("coucou")
	$Sprite2D.texture = interact_cursor
	$Sprite2D.scale = Vector2(0,0)
	var tween = create_tween()
	tween.tween_property($Sprite2D,"scale",Vector2(.5,.5),.2)
	#$Sprite2D.scale = Vector2(.4,.4)
	pass

func _not_hovered():
	#var tween = create_tween()
	#tween.tween_property($Sprite2D,"scale",Vector2(0,0),.3)
	#await tween.finished
	$Sprite2D.texture = base_cursor
	#ar t = create_tween()
	#tween.tween_property($Sprite2D,"scale",Vector2(.1,.1),.1)
	
	$Sprite2D.scale = Vector2(.1,.1)
	pass

