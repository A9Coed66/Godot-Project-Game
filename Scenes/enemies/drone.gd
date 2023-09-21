extends CharacterBody2D

var speed = 400

func _process(_delta):
	#direction
	var direction = Vector2.RIGHT
	
	#volocity
	velocity = direction * speed
	
	move_and_slide()
	
