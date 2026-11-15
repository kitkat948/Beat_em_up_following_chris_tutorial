extends CharacterBody2D

#height and width of background is 565 x 2560

@export var health : int
@export var damage : int
@export var speed : float

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var character_sprite: Sprite2D = $CharacterSprite

enum State{IDLE, BLUE_BLAST, CLIMB, GREEN_BLAST, PINK_BLAST, WALK, YELLOW_BLAST}

var state = State.IDLE

func _physics_process(_delta):
	get_input()
	movement_handling()
	animation_handling()
	sprite_flip()
	move_and_slide()

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
	
func movement_handling() -> void:
	if velocity.length() == 0:
		state = State.IDLE
	else:
		state = State.WALK


func animation_handling() -> void:
	if state == State.IDLE:
		animation_player.play("Idle")
	elif state == State.WALK:
		animation_player.play("Walk")
	elif state == State.BLUE_BLAST:
		animation_player.play("BlueBlast")
	elif state == State.GREEN_BLAST:
		animation_player.play("GreenBlast")
	elif state == State.PINK_BLAST:
		animation_player.play("PinkBlast")
	elif state == State.YELLOW_BLAST:
		animation_player.play("YellowBlast")
	elif state == State.CLIMB:
		animation_player.play("Climb")
		
		
func sprite_flip() -> void:
	if velocity.x > 0:
		character_sprite.flip_h = false
	if velocity.x < 0:
		character_sprite.flip_h = true
	
	
	
	
		
