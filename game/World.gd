extends Node2D

onready var PointsUI = $UI/PointsUI
var points = 0

func _on_Bats_enemy_killed(add_points):
	points += add_points
	PointsUI.text = "Points: " + String(points)


func _on_Player_player_death():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menu.tscn")
	
	
	
	
	
