extends CharacterBody2D

var MAX_SPEED = 40
@onready var animationplayer = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var animatedsprite = $AnimatedSprite2D
var gravity = 50

func _ready():
	animatedsprite.play("idle")

func _process(delta: float) -> void:
#	velocity.y += gravity * delta
	var dir = Input.get_axis("move left","move right")
	get_input(delta)
	move_and_slide()

func move(dir: float,delta: float):
	position.x += MAX_SPEED * delta * dir

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
