extends AnimatableBody2D

var speed: float
var direction: float

# Called when the node enters the scene tree for the first time.
func _ready():
	speed = 100.0
	direction = 27

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var move: Vector2 = Vector2(speed * delta * cos(deg_to_rad(direction)), speed * delta * sin(deg_to_rad(direction)))
	global_position += move
