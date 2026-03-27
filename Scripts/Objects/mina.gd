extends Area2D

	
func _ready() -> void:
	$Wybuch.play("idle")
	connect("body_entered", _on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.name == "Monster":
		body.wybuch()
		$Wybuch.play("explode")
		$boom.play()
		$Minasprite.visible = false
		await $Wybuch.animation_finished
		$Wybuch.play("idle")
	if body.name == "Player":
		body.SPEED = 0
		body.paralized = true
		$Wybuch.play("explode")
		$boom.play()
		$Minasprite.visible = false 
		body.visible = false
		await $Wybuch.animation_finished
		$Wybuch.play("idle")
		get_tree().change_scene_to_file("res://Scenes/Smierc.tscn")
		
