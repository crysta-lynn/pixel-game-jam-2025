extends CharacterBody2D

@onready var living_land: TileMapLayer = $"../TileMap/living land"
@onready var ghost_land: TileMapLayer = $"../TileMap/ghost land"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var speed := 10.0

const speedMultiplier := 10

var living := true

func _physics_process(delta: float) -> void:
	player_movement(delta)
	

func player_movement(delta):
	if Input.is_action_pressed("right"):
		velocity.x = speed*speedMultiplier
		velocity.y = 0
		if isLiving():
			animated_sprite_2d.play("alive walk right")
		else:
			animated_sprite_2d.play("ghost walk right")
	elif Input.is_action_pressed("left"):
		velocity.x = -speed*speedMultiplier
		velocity.y = 0
		if isLiving():
			animated_sprite_2d.play("alive walk left")
		else:
			animated_sprite_2d.play("ghost walk left")
	elif Input.is_action_pressed("down"):
		velocity.x = 0
		velocity.y = speed*speedMultiplier
		if isLiving():
			animated_sprite_2d.play("alive walk down")
		else:
			animated_sprite_2d.play("ghost walk down")
	elif Input.is_action_pressed("up"):
		velocity.x = 0
		velocity.y = -speed*speedMultiplier
		if isLiving():
			animated_sprite_2d.play("alive walk up")
		else:
			animated_sprite_2d.play("ghost walk up")
	else:
		velocity.x = 0
		velocity.y = 0
		animated_sprite_2d.stop()
	move_and_slide()

func isLiving():
	return living

func swapChar():
	if isLiving():
		animated_sprite_2d.play("alive walk down")
		animated_sprite_2d.stop()
	else:
		animated_sprite_2d.play("ghost walk down")
		animated_sprite_2d.stop()


func _on_game_world_change() -> void:
	living = !living
	if not (Input.is_action_pressed("down") or Input.is_action_pressed("left") or Input.is_action_pressed("right") or Input.is_action_pressed("up")):
			swapChar()
