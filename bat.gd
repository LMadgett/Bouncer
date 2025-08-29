extends AnimatableBody2D

var movement: float = 0.0
@export var movement_scale: float = 75.0
@export var health: int = 3
@export var health_label: Label
var start_position

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	start_position = global_position
	health_label.text = "Health: " + str(health)

func _input(event):
	if event.is_action("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if event is InputEventMouseMotion:
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			var mouse_movement: Vector2 = event.relative
			movement = mouse_movement.x
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var move: Vector2 = Vector2(movement * delta * movement_scale, 0)
	var collision_info = move_and_collide(move)
	movement = 0.0

func die():
	health -= 1
	health_label.text = "Health: " + str(health)
	global_position = start_position
	if health == 0:
		print("bat dead")
		movement_scale = 0
		global_position = start_position
		health_label.text = "NO LIVES REMAINING"
