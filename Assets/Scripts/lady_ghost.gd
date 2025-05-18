extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var inChatZone := false
var spoke_already := false
var WishFulfilled := false

func _process(delta: float) -> void:
	animated_sprite_2d.play("default")


func _on_area_2d_body_entered(body: Node2D) -> void:
	inChatZone = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	inChatZone = false
