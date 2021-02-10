extends PopupMenu

onready var Points = $PointsLabel

var WolrldScene = preload("res://World.tscn")

func _ready():
	self.popup()

func _on_Level1Button_pressed():
	PlayerStats.health = PlayerStats.max_health
# warning-ignore:return_value_discarded
#	get_tree().change_scene("res://World.tscn")
	var wolrldScene = WolrldScene.instance()
	add_child(wolrldScene)
	
	

