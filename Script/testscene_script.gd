extends Node2D

@export var knot_to_load =""

signal  knot_ready(knot)
signal door_to_load(door)

# Processing #############################
func _ready():
	_connect_children_signals()
	if $Character != null:
		$Character.position = $chara_startpos.global_position

# Methods #############################
func _connect_children_signals():
	for child in get_children():
		if child.is_in_group("interactives"):
			print("events connected")
			child.connect("clicked",_on_interactive_clicked)
		elif child.is_in_group(("doors")):
			print("doors connected")
			child.connect("door_clicked",_on_door_clicked)

# Receivers #############################
func _on_interactive_clicked(knot):
	print("world receive")
	knot_to_load=knot
	knot_ready.emit(knot)
	
func _on_door_clicked(door):
	print("world receive a door click")
	door_to_load.emit(door)
