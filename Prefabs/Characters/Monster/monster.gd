extends CharacterBody2D

@export var target: Node2D
@export var SPEED = 10
@export var aggro_time = {
	"min_time": 20,
	"max_time": 30
}

@onready var nav_agent = $NavigationAgent2D
@onready var aggro_timer = $Aggro
@onready var audio_player = $roar

var follow = true
var found_player = false
var can_move = false
signal killed

func _ready() -> void:
	if !target:
		$NavigationAgent2D/Timer.stop()
	var random_time = randi() % aggro_time["max_time"] + aggro_time["min_time"]
	print_debug(random_time)
	aggro_timer.start(random_time)

func _physics_process(_delta: float) -> void:
	var direction = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = direction * SPEED
	
	if !follow:
		velocity *= -1
		
	if !can_move:
		velocity = Vector2.ZERO
	
	if velocity != Vector2.ZERO:
		$AnimationTree.set("parameters/Standing/blend_position", velocity)
		$AnimationTree.set("parameters/Running/blend_position", velocity)
		
		
	move_and_slide()
	
func make_path() -> void:
	nav_agent.target_position = target.global_position
	


func _on_death_collison_body_entered(body: Node2D) -> void:
	if body == target:
		audio_player.play()
		SPEED = 0
		emit_signal("killed")


func _on_timer_timeout() -> void:
	make_path()


func _on_aggro_timeout() -> void:
	follow = !follow
	var random_time = randi() % aggro_time["min_time"] + aggro_time["max_time"]
	if follow:
		print_debug("Follow: true")
	else:
		print_debug("Follow: false")
	print_debug(random_time)
	aggro_timer.start(random_time)


func _on_player_detect_body_entered(body: Node2D) -> void:
	if body == target && !found_player:
		found_player = true
		aggro_timer.stop()
		follow = true
		SPEED *= 10
		print_debug("Target found")
	


func _on_roar_finished() -> void:
	get_tree().change_scene_to_file("res://Scenes/Smierc.tscn")


func start_moving() -> void:
	can_move = true
