extends Node2D

@export var player: Node2D

func _physics_process(delta: float) -> void:
	var distance_y = player.global_position.y - global_position.y
	$Reflection.global_position = Vector2(
		player.global_position.x,
		global_position.y - distance_y + 25
	)
	
	if player.velocity != Vector2.ZERO:
		player.velocity.y = player.velocity.y * -1
		$Reflection/AnimationTree.set("parameters/Standing/blend_position", player.velocity)
		$Reflection/AnimationTree.set("parameters/Walking/blend_position", player.velocity)
