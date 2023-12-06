# warning-ignore-all:return_value_discarded

extends Control

var InkPlayer = load("res://addons/inkgd/ink_player.gd")
var can_continue = false

@onready var _ink_player = InkPlayer.new()

func _ready():
	add_child(_ink_player)
	_ink_player.ink_file = load("res://Script/Inkfiles/file.ink.json")

	_ink_player.loads_in_background = true

	_ink_player.connect("loaded", Callable(self, "_story_loaded"))
	_ink_player.connect("continued", Callable(self, "_continued"))
	_ink_player.connect("prompt_choices", Callable(self, "_prompt_choices"))
	_ink_player.connect("ended", Callable(self, "_ended"))

	_ink_player.create_story()
func _process(delta):
	if Input.is_action_just_pressed("click")==true&&can_continue==true:
		_ink_player.continue_story()

# ############################################################################ #

func _story_loaded(successfully: bool):
	if !successfully:
		return
	# _observe_variables()
	# _bind_externals()
	can_continue=true
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
	_ink_player.choose_path(name)
	_ink_player.continue_story()
	
func _unwrap_text(txt):
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
	print("The End")


func _select_choice(index):
	_ink_player.choose_choice_index(index)
	_ink_player.continue_story()


# Uncomment to bind an external function.
#
# func _bind_externals():
# 	_ink_player.bind_external_function("<function_name>", self, "_external_function")
#
#
# func _external_function(arg1, arg2):
# 	pass


# Uncomment to observe the variables from your ink story.
# You can observe multiple variables by putting adding them in the array.
# func _observe_variables():
# 	_ink_player.observe_variables(["var1", "var2"], self, "_variable_changed")
#
#
# func _variable_changed(variable_name, new_value):
# 	print("Variable '%s' changed to: %s" %[variable_name, new_value])

