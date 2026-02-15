extends Line2D

@export var points_array: PackedVector2Array = []
@export var line_thickness: int = 5
var previous_points: PackedVector2Array = []
var point_draw: Vector2 
var mouseposition
var pop_index: int
var free_state: bool
var localxy: Vector2
var idle: bool
var run_once: bool
var linelist = []
var x_travel
var y_travel
var check_state: bool = false


func _ready() -> void:
	$'.'.width = line_thickness
	previous_points = []
	points_array.append(GlobalVariables.tempxy)
	points_array.append(GlobalVariables.tempxy)
	localxy = GlobalVariables.tempxy
	GlobalVariables.can_add = false
	idle = false
	run_once = true
	
	
func _process(_delta: float) -> void:
	pop_index = len(points_array) - 1
	mouseposition = GlobalVariables.currentxy
	
	#break points to check first
	if idle:
		return
	if points_array[pop_index] == Vector2(mouseposition[0], mouseposition[1]):
		return
	
	x_travel = abs(abs(mouseposition[0]) - abs(localxy[0]))
	y_travel = abs(abs(mouseposition[1]) - abs(localxy[1]))
	
	if x_travel > y_travel : #checking if mousex travel > mousey to control line
		points_array[pop_index] = Vector2(mouseposition[0], localxy[1])
		
		if Input.is_action_just_pressed("mousedown"): #script to add new point and reset local xy
			points_array.append(Vector2(mouseposition[0], points_array[len(points_array) - 1][1]))
			localxy = Vector2(mouseposition[0], points_array[len(points_array) - 1][1])

	else:
		points_array[pop_index] = Vector2(localxy[0], mouseposition[1])
		
		if Input.is_action_just_pressed("mousedown"): #copy and pasted + tweaks
			points_array.append(Vector2(points_array[len(points_array) - 1][0], mouseposition[1]))
			localxy = Vector2(points_array[len(points_array) - 1][0], mouseposition[1])
	
	if Input.is_action_pressed("rightmouse") and run_once:
		linelist.append(points_array[0])
		linelist.append(points_array[len(points_array) - 1])
		linelist.append(0) #state
		linelist.append(0) #identifier
		GlobalVariables.items.append(linelist)
		GlobalVariables.can_add = true 
		run_once = false
		print(GlobalVariables.items)
		check_state = true
		print($".".default_color)
		idle = true
	if check_state:
		if linelist[3] == 1:
			$".".default_color = 0


	$'.'.points = points_array

	
