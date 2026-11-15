extends StaticBody2D

var health: int = 1
@onready var box: Sprite2D = $Box

func take_damage(damage: int) -> void:
	health -= damage
	
	if health <= 0:
		destroy ()

func destroy() -> void:
	box.texture = preload("res://Art/Destructables/Open_Box.png")
