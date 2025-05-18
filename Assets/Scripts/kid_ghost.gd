extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var inChatZone := false
var spoke_already := false
var WishFulfilled := false

var resource = load("res://dialogue.dialogue")

func _process(delta: float) -> void:
	animated_sprite_2d.play("default")
	if inChatZone:
		if Input.is_action_just_pressed("interact"):
			print("interacting...")
			trigger_dialogue()
			if Input.is_action_just_pressed("interact"):
				next_line()

func trigger_dialogue():
	print("dialogue triggered")
	DialogueManager.show_example_dialogue_balloon(resource, "kidGhost")

func next_line():
	print("next line")
	DialogueManager.get_next_dialogue_line(resource, "kidGhost")

func _on_area_2d_body_entered(body: Node2D) -> void:
	inChatZone = true
	print("entered chat zone")

func _on_area_2d_body_exited(body: Node2D) -> void:
	inChatZone = false
	print("left chat zone")
