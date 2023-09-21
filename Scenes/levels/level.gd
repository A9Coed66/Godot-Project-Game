extends Node2D

var test_array: Array[String] = ["Tokai Teio", "Special Week", "Silent Suzuka"]


var startPosition: Vector2 = Vector2(0,0)
var startRotation: int = 0
var timeCount: float = 5
# Called when the node enters the scene tree for the first time.




func _on_area_2d_body_entered(_body):
	print("Teio")

func _on_gate_player_entered_gate():
	print("Body entered")
	pass # Replace with function body.

