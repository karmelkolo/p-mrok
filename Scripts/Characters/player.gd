extends CharacterBody2D


@export var SPEED = 25

var facing = "Down"

func _process(_delta: float) -> void:
	if velocity != Vector2(0,0):
		$Player_Sprite.animation = "Walking_" + facing
	else:
		$Player_Sprite.animation = "Standing_" + facing

func _input(event) -> void:
	if event.is_action_pressed("run"):
		SPEED = SPEED * 2
		$Player_Sprite.speed_scale = 2
	if event.is_action_released("run"):
		SPEED = SPEED / 2.0
		$Player_Sprite.speed_scale = 1

func _physics_process(_delta: float) -> void:
	var direction_x := Input.get_axis("ui_left", "ui_right")
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var direction_y := Input.get_axis("ui_up", "ui_down")
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	move_and_slide()
	
	var velocity_abs = velocity.abs()
	if velocity != Vector2(0,0):
		if velocity_abs.x > velocity_abs.y:
			if velocity.x > 0:
				facing = "Right"
			else:
				facing = "Left"
		else:
			if velocity.y > 0:
				facing = "Down"
			else:
				facing = "Up"
				
