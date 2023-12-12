extends Control

var current_scene
@onready var worldA = preload("res://Scene/Game/Level/world_sceneA.tscn")
@onready var worldB = preload("res://Scene/Game/Level/world_sceneB.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$InkManager.connect("load_room",_load_room)
	#_update_current_scene()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _update_current_scene():
	print("updated")
	current_scene=$WorldSceneHandler.get_child(0)
#	current_scene.connect("updated_knot",_update_knot)

#func _update_knot(knot):
	#$InkManager.(knot)
	
func _load_room(name):
	_instantiate_scene(_get_scene_name(name))
	_update_current_scene()
	pass

func _get_scene_name(name):
	var scene
	if name == "worldA":
		scene = worldA
	elif name == "worldB":
		scene = worldB
	return scene

func _instantiate_scene(scene):
	if $WorldSceneHandler.get_child_count()!=0:
		$WorldSceneHandler.get_child(0).queue_free()
	var s = scene.instantiate()
	$WorldSceneHandler.add_child(s)
	pass
