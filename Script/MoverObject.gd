extends CharacterBody2D

var MAX_SPEED: float = 260
@onready var animationplayer:AnimationPlayer = $AnimationPlayer
@onready var sprite:Sprite2D = $Sprite2D
signal myPos(pos)
var gravity:float = 180
var dir:float = 0
var clickpos:Vector2 = Vector2.ZERO
var vb:bool = false

func _ready():
	position = Vector2(0,0)

func _input(event):
   # Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		vb = true
		clickpos =  get_global_mouse_position()
		dir = sign(get_local_mouse_position().x)
		print("Mouse Click/Unclick at: ", get_local_mouse_position())
		print("clickpos is :", clickpos)
		print("player position", position)
		print("max speed is", MAX_SPEED)
		print("distance to click", position.distance_to(clickpos))

func _process(delta: float) -> void:
	myPos.emit(position.x)
	if vb == true:
		var dist = clickpos - position
		
		move(dir,delta)
		if position.x >= clickpos.x && dir == 1:
			clamp(position.x,position.x,clickpos.x)
			animationplayer.play("idle")
			animationplayer.advance(0)
			lerp(MAX_SPEED,0.0,1)
			vb = false
			return
		if position.x <= clickpos.x && dir == -1:
			clamp(position.x,position.x,clickpos.x)
			animationplayer.play("idle")
			animationplayer.advance(0)
			lerp(MAX_SPEED,0.0,1)
			vb = false
			return
#		if position.x <= clickpos.x && dir == 0:
#			animationplayer.play("idle")
#			animationplayer.advance(0)
#			MAX_SPEED = 0
#			vb = false
#			return
#		move(dir,delta)
		sprite.flip_h = (dir ==-1)
			
#	if dir > 0:
#		position = MAX_SPEED * delta
#	velocity.y += gravity * delta
#	var dir = Input.get_axis("move left","move right")
#	get_input(delta)
#	position.x = velocity.x*delta
	move_and_slide()

func move(dir: float,delta: float):
#	move_toward(position.x,clickpos.x,MAX_SPEED)
	MAX_SPEED = 190
	position.x += MAX_SPEED*delta * dir
	animationplayer.play("walk")
	animationplayer.advance
#	position.x += MAX_SPEED * delta * dir

func get_input(delta):
	var dir = Input.get_axis("move left","move right")
	if dir != 0:
		sprite.flip_h = (dir == -1)
		animationplayer.play("walk")
		animationplayer.advance
		move(dir,delta)
	else:
		velocity = Vector2.ZERO
		animationplayer.play("idle")
		animationplayer.advance(0)


func _on_enemy_detector_area_entered(area: Area2D) -> void:
	queue_free()
