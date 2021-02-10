extends YSort

export(int) var MAX_COUNT = 5
export(int) var POINTS = 1
export(int) onready var COUNT = 3 setget set_count
export(int) onready var DELAY = 3 setget set_delay
export(Resource) var ENEMY_SCENE

onready var EnemyScene = load(ENEMY_SCENE.get_path())

onready var timer = $Timer
onready var topLeft = $TopLeft
onready var bottomRight = $BottomRight

signal enemy_killed(points)

func set_count(value):
	if value > MAX_COUNT:
		COUNT = MAX_COUNT
	else:
		COUNT = value

func set_delay(value):
	if value < 1:
		DELAY = 1
	else:
		DELAY = value
	if (timer):
		timer.wait_time = DELAY

func _ready():
	timer.wait_time = DELAY
	
	if COUNT > MAX_COUNT:
		COUNT = MAX_COUNT
		
	for _n in range(COUNT):
		add_enemy()

func _on_Timer_timeout():
	if COUNT < MAX_COUNT:
		add_enemy()
		COUNT += 1

func add_enemy():
	var x = rand_range(topLeft.position.x, bottomRight.position.x)
	var y = rand_range(topLeft.position.y, bottomRight.position.y)
	var instance = EnemyScene.instance()
	instance.connect("death", self, "decrement_count")
	instance.position.x = x
	instance.position.y = y
	self.add_child(instance)
	

func decrement_count():
	COUNT -= 1
	emit_signal("enemy_killed", POINTS)
