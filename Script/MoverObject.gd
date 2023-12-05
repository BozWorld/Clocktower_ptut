extends CharacterBody2D

var run_speed = 30.0
var attacks = ["attack1", "attack2"]
@onready var animationplayer = $AnimationPlayer
@onready var animatedsprite = $AnimatedSprite2D

func _ready():
	animatedsprite.play("idle")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("move right"):
		animationplayer.play("walk")
		velocity += Vector2(run_speed * delta,0)
		position = velocity * delta
		move_and_slide()
