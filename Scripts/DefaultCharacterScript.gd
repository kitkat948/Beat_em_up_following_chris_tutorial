extends CharacterBody2D

#height and width of background is 565 x 2560

@export var health : int
@export var damage : int
@export var speed : float

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
func _physics_process(_delta):
	get_input()
	move_and_slide()
