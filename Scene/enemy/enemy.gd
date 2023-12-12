extends Area2D

@export var playerpos: float = 0
@export var animationplayer:AnimationPlayer
@onready var sprite:Sprite2D = $Sprite2D
var MAX_SPEED = 150

func _process(delta: float) -> void:
	moveTo(Vector2(playerpos,0) ,delta)

func receive_pos(value):
	playerpos = value
	
func moveTo(v1:Vector2,delta:float):
	var dir = (v1 - position).normalized()
	var dirsign = sign(dir)
	position.x += delta * dirsign.x * MAX_SPEED
	if dirsign.x <0:
		sprite.flip_h = true
	if dirsign.x >0:
		sprite.flip_h = false
	animationplayer.play("walk")
	
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
#
#
#func move(p:CharacterBody2D):
#	var dir = (p.position - position)
#	position.x += MAX_SPEED * delta * dir