extends Node2D

var enemy = null
var enemy_enter_count = 0
var bersek_exit_time = 0

func _on_area_2d_area_entered(area):
	enemy_enter_count += 1
	bersek_exit_time = 0
	$StateChart.set_expression_property("enemy_entered_count", enemy_enter_count)
	$StateChart.set_expression_property("delay_seconds", bersek_exit_time)	#Neu vao area thi reset time Bersek
	$StateChart.send_event("enemy_entered")
	enemy = area.get_parent()


func _on_area_2d_area_exited(area):
	$StateChart.send_event("enemy_exited")


func _on_observing_state_processing(delta):
	look_at(enemy.global_position)


func _on_idle_state_entered():
	rotation = -PI/2


func _on_bersek_state_entered():
	$Icon.modulate = Color.RED


func _on_normal_state_entered():
	$Icon.modulate = Color.WHITE
	enemy_enter_count = 0


func _on_bersek_state_processing(delta):
	bersek_exit_time += delta
	$StateChart.set_expression_property("delay_seconds", bersek_exit_time)
	$StateChart.send_event("enemy_exiting")

