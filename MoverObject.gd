extends Node2D


var speed : float = 5
var canMove: bool = true
var move: bool = false
var velocity: Vector2  = Vector2.ZERO
var goto: Vector2 = Vector2.ZERO
@export var movetimer: Timer
@export var dirLine: Line2D

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if canMove:
				canMove = false
				goto = event.position
				move = true
				movetimer.start()


func _process(delta: float) -> void:
	dirLine.get
	move_to(goto,delta)
	position += velocity * delta
	var test = 0

func move_to(v1:Vector2,delta: float) :
	if !move:
		return
	else:
		var dir = v1 - position
		var dirto = dir.normalized()
		print(dir)
		if dir.length() <= 0:
			move = false
			velocity = Vector2.ZERO
			position = v1
		velocity += speed * delta * dirto
	
func _on_can_move_timer_timeout():
	canMove = true
