extends CharacterBody2D

@export var target: Node2D = null
@export var SPEED = 10;
@export var maxWaitTime = 10;
@export var minWaitTime = 2;
var following = true

func _physics_process(_delta: float) -> void:
	var direction = target.global_position - global_position
	velocity = direction.normalized() * SPEED
	
	if !following:
		velocity = velocity * -1
	
	if velocity != Vector2.ZERO:
		$AnimationTree.set("parameters/Standing/blend_position", velocity)
		$AnimationTree.set("parameters/Running/blend_position", velocity)
		
	move_and_slide()


func _on_death_collison_body_entered(body: Node2D) -> void:
	if body is Player:
		get_tree().change_scene_to_file("res://Scenes/Smierc.tscn")


func _on_timer_timeout() -> void:
	following = !following
	var newWaitTime = randi_range(minWaitTime, maxWaitTime)
	$Timer.start(newWaitTime)
	print_debug("Following: " + str(following))
	print_debug("Wait Time: " + str(newWaitTime))
	pass # Replace with function body.
