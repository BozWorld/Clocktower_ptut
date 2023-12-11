extends Control

@export var world_sceneA = preload("res://Scene/Game/Level/world_sceneA.tscn")
@export var world_sceneB = preload("res://Scene/Game/Level/world_sceneB.tscn")
@export var stairs_scene = preload("res://Scene/Game/Level/stairs_world_scene.tscn")
var current_scene

func _ready():
	current_scene = stairs_scene
	_load_world_scene(current_scene)

func _load_world_scene(scene):
	if $WorldSceneHandler.get_child_count()!=0:
		$WorldSceneHandler.get_child(0).queue_free()
	var s = scene.instantiate()
	$WorldSceneHandler.add_child(s)
	_display_scene(s)
	for child in $WorldSceneHandler.get_children():
		child.connect("knot_ready",_set_knot)
		child.connect("door_to_load",_set_world_scene)

func _set_knot(knot):
	$InkManager._set_path_string(knot)

func _set_world_scene(door_name):
	if door_name == "DoorA":
		_load_world_scene(world_sceneA)
	elif door_name=="DoorB":
		_load_world_scene(world_sceneB)
	elif door_name == "stairs":
		_load_world_scene(stairs_scene)

func _display_scene(scene):
	scene.scale = Vector2(1,0)
	var tween = create_tween()
	tween.tween_property(scene,"scale",Vector2(1,1),.5)
