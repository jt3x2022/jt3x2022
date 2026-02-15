extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GlobalVariables.drawmode:
		$MarginContainer/Label.text = "Draw Mode = True"
	else:
		$MarginContainer/Label.text = "Draw Mode = False"
