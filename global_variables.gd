extends Node2D

var can_add: bool #for line creation
var drawmode : bool #for line creation
var tempxy: Vector2 #for line creation
var currentxy: Vector2 #for line creation
var items = [] #for list
var points_list:PackedVector2Array = [] #for points for drawing dots
var points = [] #for all points and items on the points
var mouseXY: Vector2 

func _process(_delta: float) -> void:
	mouseXY = get_global_mouse_position()
