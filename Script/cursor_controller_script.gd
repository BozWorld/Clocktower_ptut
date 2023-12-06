extends Control

var current_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	current_scene=$WorldSceneHandler.get_child(0)
	current_scene.connect("updated_chunk",_update_chunk)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _update_chunk(knot):
	$InkManager._set_path_string(knot)
