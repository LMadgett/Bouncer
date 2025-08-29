extends StaticBody2D

@export var health: int
var start_health = health
@export var RedBrickSprite: Sprite2D
@export var GreyBrickSprite: Sprite2D
@export var GreenBrickSpriteUndamaged: Sprite2D
@export var GreenBrickSpriteDamaged: Sprite2D

func _ready():
	start_health = health
	if health == 1:
		RedBrickSprite.visible = true
		GreyBrickSprite.visible = false
		GreenBrickSpriteUndamaged.visible = false
		GreenBrickSpriteDamaged.visible = false
	if health == 2:
		RedBrickSprite.visible = false
		GreyBrickSprite.visible = true
		GreenBrickSpriteUndamaged.visible = false
		GreenBrickSpriteDamaged.visible = false
	if health == 3:
		RedBrickSprite.visible = false
		GreyBrickSprite.visible = false
		GreenBrickSpriteUndamaged.visible = true
		GreenBrickSpriteDamaged.visible = false

func ball_hit():
	health -= 1
	if start_health == 3 and health == 1:
		GreenBrickSpriteUndamaged.visible = false
		GreenBrickSpriteDamaged.visible = true
	elif health == 0:
		queue_free()
		
func get_health():
	return health
	
func get_points():
	return start_health
