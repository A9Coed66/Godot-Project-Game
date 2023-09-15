extends Node2D

var aimCheck: bool = false

func _process(delta):
	
	#get input
	var direction = Input.get_vector("left", "right", "up", "down")
#	print(direction)
	position += direction * 200 * delta
	
	#Bantumlum
	if Input.is_action_just_pressed("primary action"):
		print("Bantumtoe")
	if Input.is_action_just_pressed("secondary action"):
		if !aimCheck:
			print("s1mple bật tâm")
		else:
			print("s1mple tắt tâm")
		aimCheck = !aimCheck
	if Input.is_action_just_pressed("third action"):
			if aimCheck:
				print("Ôi không Niko anh trượt DE và bị s1mple hạ")
				aimCheck = false
			else:
				print("Không tâm xuyên tường vẫn headshot, chuyện gì thế này")
				
