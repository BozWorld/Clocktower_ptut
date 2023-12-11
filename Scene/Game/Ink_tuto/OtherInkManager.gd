# warning-ignore-all:return_value_discarded

extends Control

var InkPlayer = load("res://addons/inkgd/ink_player.gd")
@onready var _ink_player = InkPlayer.new()

@export var can_continue = false
signal load_room(name)

# PROCESSING ##################################
func _ready():
	add_child(_ink_player)
	_ink_player.ink_file = load("res://Script/Inkfiles/file.ink.json")

	_ink_player.loads_in_background = true

	_ink_player.connect("loaded", Callable(self, "_story_loaded"))
	_ink_player.connect("continued", Callable(self, "_continued"))
	_ink_player.connect("prompt_choices", Callable(self, "_prompt_choices"))
	_ink_player.connect("ended", Callable(self, "_ended"))

	_ink_player.create_story()
	#scale=Vector2(1,0)

func _process(delta):
	if Input.is_action_just_pressed("click")==true&&can_continue==true:
		_ink_player.continue_story()

# ############################################################################ #

func _story_loaded(successfully: bool):
	if !successfully:
		return
	# _observe_variables()
	_bind_externals()
	can_continue=true
	#_ink_player.choose_path("DoorB")
	#_ink_player.continue_story()


func _continued(text, tags):
	_unwrap_text(_ink_player.current_text)
	# Here you could yield for an hypothetical signal, before continuing.
	# await self.event
	#_ink_player.continue_story()


# ############################################################################ #
# Private Methods
# ############################################################################ #
func _set_path_string(name):
	print("knot loaded")
	_ink_player.choose_path(name)
	_ink_player.continue_story()

func _unwrap_text(txt):
	#if $TextBox/MarginContainer/Label.text == "":
	#	var t = create_tween()
	#	t.tween_property(self,"scale",Vector2(1,1),.3)
	#	await t.finished
	can_continue=false
	$TextBox/MarginContainer/Label.text=txt
	$TextBox/MarginContainer/Label.visible_ratio=0
	var tween = create_tween()
	tween.tween_property($TextBox/MarginContainer/Label,"visible_ratio",1,1)
	await tween.finished
	can_continue= true

func _prompt_choices(choices):
	if !choices.is_empty():
		print(choices)
		# In a real world scenario, _select_choice' could be
		# connected to a signal, like 'Button.pressed'.
		_select_choice(0)

func _ended():
	$TextBox/MarginContainer/Label.text=""
	#var tween = create_tween()
	#tween.tween_property(self,"scale",Vector2(1,0),0.3)
	print("The End")

func _select_choice(index):
	_ink_player.choose_choice_index(index)
	_ink_player.continue_story()


# Uncomment to bind an external function.	
func _bind_externals():
	_ink_player.bind_external_function("move_to", self, "_move_to")

func _move_to(name):
	print("move needed")
#	load_room.emit(name)

# Uncomment to observe the variables from your ink story.
# You can observe multiple variables by putting adding them in the array.
# func _observe_variables():
# 	_ink_player.observe_variables(["var1", "var2"], self, "_variable_changed")
#
#
# func _variable_changed(variable_name, new_value):
# 	print("Variable '%s' changed to: %s" %[variable_name, new_value])

