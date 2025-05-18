@tool

extends TileMapLayer

@export var ghostWorldTilemap: TileMapLayer
@export var sync_map := false:
	set = _sync_map_toggled
var tile_coord
var tile_source
var tile_alt

func _ready():
	print("sync is ready")

func _sync_map_toggled(value):
	print("sync Map toggled ", value)
	if value:
		sync_ghost_world()
		print("ghost sync triggered")

func sync_ghost_world():
	print("syncing ghost")
	
	if not ghostWorldTilemap:
		print("ghost world not assigned")
		return
	
	ghostWorldTilemap.clear()
	print("Getting Used Cells")
	for cell in get_used_cells():
		tile_coord = get_cell_atlas_coords(cell) 
		tile_source = get_cell_source_id(cell)
		tile_alt = get_cell_alternative_tile(cell)
		print("Source Cell: ",cell,", atlas coordinats ", tile_coord)
		
		if tile_coord != null:
			ghostWorldTilemap.set_cell(cell, tile_source, tile_coord, tile_alt)
			print("set ghost cell: ",cell," with tile: ",tile_coord)
	print("ghost synced")
