extends SubViewport



func _process(delta):
	$"../../Camera2D".position =$"../../Character".position
	#position=$"../../../Character".position
	pass
