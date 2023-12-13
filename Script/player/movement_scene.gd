extends Node2D

@onready var character = $Character
@export var light:PointLight2D = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	character.myPos.connect($Enemy.receive_pos)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var tw = get_tree().create_tween()
	tw.tween_property(light, "texture_scale", 10, 6)
	var twsize = get_tree().create_tween()
	twsize.tween_property(light, "energy", 2.3, 8)
	pass
