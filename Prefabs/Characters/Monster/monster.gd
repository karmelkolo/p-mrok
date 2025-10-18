extends CharacterBody2D

@export var target: Node2D
@export var SPEED = 10
@onready var nav_agent = $NavigationAgent2D

func _ready() -> void:
	if !target:
		$NavigationAgent2D/Timer.stop()

func _physics_process(_delta: float) -> void:
	var direction = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = direction * SPEED
	
	if velocity != Vector2.ZERO:
		$AnimationTree.set("parameters/Standing/blend_position", velocity)
		$AnimationTree.set("parameters/Running/blend_position", velocity)
		
	move_and_slide()
	
func make_path() -> void:
	nav_agent.target_position = target.global_position
	


func _on_death_collison_body_entered(body: Node2D) -> void:
	if body is Player:
		get_tree().change_scene_to_file("res://Scenes/Smierc.tscn")


func _on_timer_timeout() -> void:
	make_path()
