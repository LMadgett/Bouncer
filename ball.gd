extends AnimatableBody2D

var direction: Vector2
var speed: float

# Called when the node enters the scene tree for the first time.
func _ready():
	speed = 650
	direction = Vector2(50.0, 70.0).normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var collision_info = move_and_collide(speed * direction * delta)
	while collision_info:
		var other_object = collision_info.get_collider()
		if other_object.is_in_group("Brick"):
			other_object.ball_hit()
		var movement_remaining := collision_info.get_remainder()
		var remaining_length = movement_remaining.length()
		direction = direction.bounce(collision_info.get_normal())
		collision_info = move_and_collide(direction * remaining_length)
