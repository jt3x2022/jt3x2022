extends Node2D

var linedrawer: PackedScene = load("res://line_drawer.tscn")
var circlepng: PackedScene = load("res://circle.tscn")
var mouseposition: Vector2
var dotlist_x = []
var dotlist_y = []

func create_dot_list():
	for i in range(2000 / (10 + 7.2)): #initialize dot list for x range to be created as instances
		dotlist_x.append(i * (7.2 + 10))
	for i in range(900 / (10 + 7.2)):
		dotlist_y.append(i * (7.2 + 10))

func print_dot(list_x, list_y):
	for x in list_x:
		for y in list_y:
			GlobalVariables.points_list.append(Vector2(x, y))
			var dot = circlepng.instantiate()
			$Circles.add_child(dot)
	GlobalVariables.points = GlobalVariables.points_list

func line_creator():
	mouseposition = GlobalVariables.mouseXY 
	if Input.is_action_just_pressed("draw_mode_toggle"):
		if GlobalVariables.drawmode:
			GlobalVariables.drawmode = false
		else:
			GlobalVariables.drawmode =  true
			GlobalVariables.can_add = true
		
	if Input.is_action_just_pressed("mousedown") and GlobalVariables.drawmode and GlobalVariables.can_add:
		var newline = linedrawer.instantiate()
		GlobalVariables.tempxy = GlobalVariables.currentxy
		$Lines.add_child(newline)

func _ready() -> void:
	GlobalVariables.drawmode = false
	GlobalVariables.can_add = true
	create_dot_list()
	print_dot(dotlist_x, dotlist_y)
	
func _process(_delta: float) -> void:
	line_creator()
	if Input.is_action_just_pressed("rightmouse"):
		print(GlobalVariables.items)
