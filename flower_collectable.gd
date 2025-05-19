extends Area2D

var inPickupZone := false
var collected := false

func _process(delta: float) -> void:
	if inPickupZone:
		if Input.is_action_just_pressed("ui_accept"):
			collected = true
			queue_free()
			print("Pink Flower collected")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		inPickupZone = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		inPickupZone = true
