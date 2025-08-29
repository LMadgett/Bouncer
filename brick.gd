extends StaticBody2D

@export var health: int = 1

func ball_hit():
	health -= 1
	if health == 0:
		queue_free()
