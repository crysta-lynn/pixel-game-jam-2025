extends CharacterBody2D

@onready var living_land: TileMapLayer = $"../TileMap/living land"
@onready var ghost_land: TileMapLayer = $"../TileMap/ghost land"

@export var speed := 10.0

const speedMultiplier := 10

var living := true

func _physics_process(delta: float) -> void:
	player_movement(delta)

func player_movement(delta):
	if Input.is_action_pressed("right"):
		velocity.x = speed*speedMultiplier
		velocity.y = 0
	elif Input.is_action_pressed("left"):
		velocity.x = -speed*speedMultiplier
		velocity.y = 0
	elif Input.is_action_pressed("down"):
		velocity.x = 0
		velocity.y = speed*speedMultiplier
	elif Input.is_action_pressed("up"):
		velocity.x = 0
		velocity.y = -speed*speedMultiplier
	else:
		velocity.x = 0
		velocity.y = 0
	move_and_slide()
	
func isLiving():
	if Input.is_action_pressed("swapWorld"):
		living = !living
	return living

func swapMap():
	if isLiving():
		living_land.visible
		ghost_land.hide
	if !isLiving():
		living_land.hide
		ghost_land.visible
