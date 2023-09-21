extends CharacterBody2D


var aimCheck: bool = false
var can_laser: bool = true
var can_grenade: bool = true
var current_bullet: int = 18
@export var speed = 300

signal laser
signal grenade


func _process(delta):
	#get input
	var direction = Input.get_vector("left", "right", "up", "down")
#	print(direction)
	velocity = direction * speed
	move_and_slide()
	#Bantumlum
#	if Input.is_action_just_pressed("primary action"):
#		print("Bantumtoe")
#	if Input.is_action_just_pressed("secondary action"):
#		if !aimCheck:
#			print("s1mple bật tâm")
#		else:
#			print("s1mple tắt tâm")
#		aimCheck = !aimCheck
#	if Input.is_action_just_pressed("third action"):
#			if aimCheck:
#				print("Ôi không Niko anh trượt DE và bị s1mple hạ")
#				aimCheck = false
#			else:
#				print("Không tâm xuyên tường vẫn headshot, chuyện gì thế này")
	if Input.is_action_pressed("primary action") and can_laser:
		print("shoot laser")
		can_laser = false
		$LaserTimer.start()
		laser.emit()
	
	if Input.is_action_pressed("secondary action") and can_grenade:
		print("shoot grenade")
		can_grenade = false
		$GrenadeTimer.start()
		grenade.emit()
	if Input.is_action_just_pressed("limited_bullet"):
		if current_bullet<=0:
			print("Runout of bullet")
			return
		print("Limited bullet shoot")
		current_bullet-=1
		$LimitedBulletTimer.stop()
	if $LimitedBulletTimer.is_stopped():
		$LimitedBulletTimer.start()
	#Hàm nạp luôn hoạt động, dừng/ ngắt nạp khi bắn


func _on_laser_timer_timeout():
	can_laser = true
	print("Reload laser")


func _on_grenade_timer_timeout():
	can_grenade = true
	print("Reload grenade")
	

#Hàm bắn với số đạn hữu hạn và có reload
func limited_bullet_gun():
	if current_bullet < 18:
		current_bullet += 1
		print("Reload limited bullet, current bullet %d" % current_bullet)
