extends AnimatableBody2D

var movement: float = 0.0
@export
var movement_scale: float = 75.0

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


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
