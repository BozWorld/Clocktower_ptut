extends Node2D

@export var next_chunk =""
signal updated_chunk(chunk)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass




func _on_npc_clicked(knot):
	next_chunk=knot
	updated_chunk.emit(next_chunk)
	pass # Replace with function body.
