extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var inChatZone := false
var questReceived := false
var WishFulfilled := false
var dialogueActive := false

var resource = load("res://dialogue.dialogue")

func _ready() -> void:
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

func _process(delta: float) -> void:
	animated_sprite_2d.play("default")
	if inChatZone == true:
		if Input.is_action_just_pressed("ui_accept"):
			
			if  not dialogueActive:
				print("interacting...")
				dialogueActive = true
				trigger_dialogue()


func trigger_dialogue():
	print("dialogue triggered")
	DialogueManager.show_example_dialogue_balloon(resource, "kidGhost")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		inChatZone = true
		print("entered chat zone")

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		inChatZone = false
		print("left chat zone")

func _on_dialogue_ended(resource):
	print("dialogue ended")
	await get_tree().create_timer(1.0).timeout
	dialogueActive = false
