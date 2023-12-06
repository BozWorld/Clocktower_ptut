extends Area2D

@export var player: CharacterBody2D
var MAX_SPEED = 40
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func move(p:CharacterBody2D):
	var dir = (p.position - position)
	position.x += MAX_SPEED * delta * dir
