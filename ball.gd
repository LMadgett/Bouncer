extends AnimatableBody2D

var direction: Vector2
var speed: float
@export var bat: AnimatableBody2D
var start_position
var timer := Timer.new()
var start_speed = 650
var reset = false
var fixed_to_bat = false

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(timer)
	timer.wait_time = 1.0
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout)
	speed = start_speed
	
	direction = Vector2(randf_range(-0.3, 0.3), 1).normalized()
	start_position = global_position
	process_mode = Node.PROCESS_MODE_PAUSABLE
	
func _on_timer_timeout():
	speed = start_speed
	reset = false
	fixed_to_bat = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fixed_to_bat:
		global_position = Vector2(bat.position.x, bat.position.y - 25)

func _physics_process(delta):	
	reset = false
	var collision_info = move_and_collide(speed * direction * delta)
	while collision_info:
		var other_object = collision_info.get_collider()
		if other_object.is_in_group("Brick"):
			if other_object.get_health() == 1:
				bat.update_points(other_object.get_points())
			other_object.ball_hit()
		elif other_object.is_in_group("ScreenBottom"):
			bat.die()
			if bat.health == 0:
				global_position = start_position
				speed = 0
			else:
				direction = Vector2(0, -1).normalized()
				collision_info = null
				reset = true
				fixed_to_bat = true
				timer.start()
				speed = 0
		if not reset:
			var movement_remaining := collision_info.get_remainder()
			var remaining_length = movement_remaining.length()
			direction = direction.bounce(collision_info.get_normal())
			collision_info = move_and_collide(direction * remaining_length)
