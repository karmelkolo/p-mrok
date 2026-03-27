extends Area2D

	
func _ready() -> void:
	connect("body_entered", _on_body_entered)

func _on_body_entered(body: Node) -> void:
	
	if body.name == "Player":
		print(body.SPEED)
		body.paralized = true
		visible = false
		$boom.play()
		await get_tree().create_timer(3).timeout
		body.paralized = false
		queue_free()
		
		
		
