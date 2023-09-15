extends Node2D

var test_array: Array[String] = ["Tokai Teio", "Special Week", "Silent Suzuka"]


var startPosition: Vector2 = Vector2(0,0)
var startRotation: int = 0
var timeCount: float = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	startPosition = $Logo.position
	for i in test_array:
		print(i)
	
	
func _process(delta):
	$Logo.rotation_degrees += 200 * delta
	if $Logo.position.x>1000:
		$Logo.pos.x = 0
		$Logo.position = startPosition
	if Input.is_action_pressed("left"):
		pass
