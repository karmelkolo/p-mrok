extends Area2D

@export var top_layer: StaticBody2D

func _on_body_exited(body: Node2D) -> void:
	top_layer.body_inside = null


func _on_body_entered(body: Node2D) -> void:
	top_layer.body_inside = body
