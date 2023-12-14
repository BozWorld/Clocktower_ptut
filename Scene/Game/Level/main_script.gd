extends Control

@export var world_sceneA = preload("res://Scene/Game/Level/world_sceneA.tscn")
@export var world_sceneB = preload("res://Scene/Game/Level/world_sceneB.tscn")
@export var world_sceneC = preload("res://Scene/Game/Level/world_sceneC.tscn")
@export var world_sceneD = preload("res://Scene/Game/Level/world_sceneD.tscn")
@export var world_sceneE = preload("res://Scene/Game/Level/world_sceneE.tscn")
@export var world_sceneF = preload("res://Scene/Game/Level/world_sceneF.tscn")

var current_scene
signal disable_actions
signal enable_actions

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	current_scene = world_sceneC
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
		$WorldSceneHandler.position.x=230
		_load_world_scene(world_sceneB)
	elif door_name=="DoorC":
		_load_world_scene(world_sceneC)
		$WorldSceneHandler.position= Vector2(100,105)
	elif door_name=="DoorD":
		_load_world_scene(world_sceneD)
		$WorldSceneHandler.position= Vector2(0,105)
	elif door_name=="DoorE":
		_load_world_scene(world_sceneE)
		$WorldSceneHandler.position = Vector2(430,30)
	elif door_name=="DoorF":
		_load_world_scene(world_sceneF)
		$WorldSceneHandler.position= Vector2(0,105)

func _display_scene(scene):
	scene.scale = Vector2(0,1)
	var tween = create_tween()
	tween.tween_property(scene,"scale",Vector2(1,1),.3)



