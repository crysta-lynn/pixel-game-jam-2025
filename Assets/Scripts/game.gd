extends Node2D

signal world_change

var living = true

@onready var living_land: TileMapLayer = $"TileMap/living land"
@onready var ghost_land: TileMapLayer = $"TileMap/ghost land"

func _process(delta: float) -> void:
	change_world_state()
	change_world_appearance()

func change_world_state():
	if Input.is_action_just_pressed("swapWorld"):
		emit_signal("world_state_changed")
		living = !living

func change_world_appearance():
	living_land.visible = living
	ghost_land.visible = !living
