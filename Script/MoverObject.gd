extends CharacterBody2D

var MAX_SPEED = 100
var attacks = ["attack1", "attack2"]
@onready var animationplayer = $AnimationPlayer
@onready var animatedsprite = $AnimatedSprite2D
var gravity = 50

func _ready():
	animatedsprite.play("idle")

func _process(delta: float) -> void:
	velocity.y += gravity * delta
	if Input.is_action_just_pressed("move right"):
		animationplayer.play("walk")
		velocity += Vector2(MAX_SPEED * delta,0)
		position = velocity * delta
	move_and_slide()
