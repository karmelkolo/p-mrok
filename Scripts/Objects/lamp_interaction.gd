extends Area2D

var showInteractionLabel = false

func _process(_delta: float) -> void:
	$Label.visible = showInteractionLabel
	
	if showInteractionLabel && Input.is_action_just_pressed("interact"):
		%"Systemy-Ikona".queue_free()
		$".".queue_free()
		%Player.expand_darkness(2)

func _on_body_entered(body):
	if body is Player:
		%"Systemy-Ikona".texture = load('res://Systemy_-_Ikona_Interakcja.gal.png')
		%"Systemy-Ikona".position += Vector2(-0.5,1)
		showInteractionLabel = true

func _on_body_exited(body):
	if body is Player && is_instance_valid(%"Systemy-Ikona"):
		%"Systemy-Ikona".texture = load('res://Systemy_-_Ikona.png')
		%"Systemy-Ikona".position += Vector2(0.5,-1)
		showInteractionLabel = false
