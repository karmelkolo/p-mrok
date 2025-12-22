extends Area2D

var showInteractionLabel = false

func _process(_delta: float) -> void:
	$Label.visible = showInteractionLabel
	
	if showInteractionLabel && Input.is_action_just_pressed("interact"):
		$"../pick_up_key".play()
		%Player.has_key = true; 
		$".".queue_free()


func _on_body_entered(body: Player) -> void:
	$ObiektKlucz.texture = load("res://Textures/Objects/That's The Key To Our Problems/Obiekt_-_Klucz_Interakcja1.png")
	showInteractionLabel = true 
 	


func _on_body_exited(body: Player) -> void:
	$ObiektKlucz.texture = load("res://Textures/Objects/That's The Key To Our Problems/Obiekt - Klucz.png")
	showInteractionLabel = false
