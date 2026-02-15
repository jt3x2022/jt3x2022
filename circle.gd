extends Node2D
var greentexture: Texture2D = preload("res://Assets/green-dot.png")
var greytexture: Texture2D = preload("res://Assets/greydot-removebg-preview.png")
var mouse_detection_range: float = 8.5

func _ready() -> void:
	$".".position = GlobalVariables.points_list[0]
	GlobalVariables.points_list.remove_at(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GlobalVariables.mouseXY.x > position.x - mouse_detection_range \
	and GlobalVariables.mouseXY.x < position.x + mouse_detection_range \
	and GlobalVariables.mouseXY.y > position.y - mouse_detection_range \
	and GlobalVariables.mouseXY.y < position.y + mouse_detection_range:
		$Sprite2D.texture = greentexture
		GlobalVariables.currentxy = position
	else:
		$Sprite2D.texture = greytexture
