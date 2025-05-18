extends Node2D

signal change_world_state

var living = true

@onready var living_land: TileMapLayer = $"TileMap/living land"
@onready var ghost_land: TileMapLayer = $"TileMap/ghost land"
@onready var living_terrain_objects: TileMapLayer = $"TileMap/living terrain objects"
@onready var ghost_terrain_objects: TileMapLayer = $"TileMap/ghost terrain objects"
@onready var kid_ghost: StaticBody2D = $chars/kid_ghost
@onready var lady_ghost: StaticBody2D = $"chars/lady ghost"
@onready var old_lady_ghost: StaticBody2D = $"chars/old lady ghost"

func _process(delta: float) -> void:
	change_state()
	change_world_appearance()

func change_state():
	if Input.is_action_just_pressed("swapWorld"):
		emit_signal("change_world_state")
		living = !living

func change_world_appearance():
	living_land.visible = living
	living_terrain_objects.visible = living
	ghost_land.visible = !living
	ghost_terrain_objects.visible = !living
	kid_ghost.visible = !living
	lady_ghost.visible = !living
	old_lady_ghost.visible = !living
