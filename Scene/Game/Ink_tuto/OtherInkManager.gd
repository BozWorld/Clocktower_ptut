# warning-ignore-all:return_value_discarded

extends Control
var p_idle = load("res://Assets/Visuel/ada_portraits/img_ada_01.png")
var p_angry = load("res://Assets/Visuel/ada_portraits/img_ada_05.png")
var p_cry = load("res://Assets/Visuel/ada_portraits/img_ada_13.png")
var p_worry = load("res://Assets/Visuel/ada_portraits/img_ada_12.png")
var p_focus = load("res://Assets/Visuel/ada_portraits/img_ada_11.png")
var p_maria = load("res://Assets/Visuel/ada_portraits/img_maria_01.png")
var p_phone = load("res://Assets/Visuel/ada_portraits/img_phone_01.png")

var InkPlayer = load("res://addons/inkgd/ink_player.gd")
@onready var _ink_player = InkPlayer.new()

@export var can_continue = false
signal load_room(name)

@onready var txtbox = $TextBox/MarginContainer/Label
@onready var button1 =$TextBox/VSplitContainer/Button
@onready var button2 =$TextBox/VSplitContainer/Button2
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
	$TextBox.scale=Vector2(1,0)

func _process(delta):
	if Input.is_action_just_pressed("click")||Input.is_action_just_pressed("Continue")==true&&can_continue==true:
		_ink_player.continue_story()

# ############################################################################ #

func _story_loaded(successfully: bool):
	if !successfully:
		return
	# _observe_variables()
	_bind_externals()
	can_continue=true
	#_ink_player.choose_path("start")
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
	#_ink_player.continue_story()

func _unwrap_text(txt):
	
	if !"_" in txt:
		print("no prefix")
		return
	var splits = txt.split("_")
	var portrait = splits[0]
	_set_portraits(portrait)
	var text = splits[1]
	var t = create_tween()
	t.tween_property($TextBox,"scale",Vector2(1,1),.3)
	await t.finished
	can_continue=false
	$TextBox/MarginContainer/Label.text=text
	$TextBox/MarginContainer/Label.visible_ratio=0
	var tween = create_tween()
	tween.tween_property($TextBox/MarginContainer/Label,"visible_ratio",1,1)
	await tween.finished
	can_continue= true

func _set_portraits(character):
	if character == "idle":
		$Portrait.texture = p_idle
	elif character =="angry":
		$Portrait.texture = p_angry
	elif character == "cry":
		$Portrait.texture = p_cry
	elif character == "maria":
		$Portrait.texture = p_maria
	elif character =="phone":
		$Portrait.texture = p_phone
	elif character == "worry":
		$Portrait.texture = p_worry
	elif character == "focus":
		$Portrait.texture = p_focus

func _prompt_choices(choices):
	if !choices.is_empty():
		print(choices)
		_display_choices(choices)
		# In a real world scenario, _select_choice' could be
		# connected to a signal, like 'Button.pressed'.
		#_select_choice(0)

func _display_choices(choices):
	txtbox.visible=false
	txtbox.text=""
	button1.visible=true
	button2.visible=true
	button1.text=choices[0].text
	button2.text=choices[1].text

	
	pass

func _ended():
	$TextBox/MarginContainer/Label.text=""
	print("The End")

func _select_choice(index):
	_ink_player.choose_choice_index(index)
	#_ink_player.continue_story()

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



func _on_button_pressed():
	_select_choice(0)
	button1.visible = false
	button2.visible = false 
	txtbox.visible=true
	pass # Replace with function body.


func _on_button_2_pressed():
	_select_choice(1)
	button1.visible = false
	button2.visible = false 
	txtbox.visible=true
	pass # Replace with function body.
