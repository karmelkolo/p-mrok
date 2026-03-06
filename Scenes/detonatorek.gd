extends Area2D

var showInteractionLabel = false
var boomon = false
func _process(_delta: float) -> void:
	$Label.visible = showInteractionLabel
	if showInteractionLabel && Input.is_action_just_pressed("interact"):
		boomon = true
		print("todobrze")
	

func _on_body_entered(body: Player) -> void:
	$ObiektDetonator.texture = load("res://Textures/Objects/Boom Bomm/Obiekt - Detonator (Interakcja).png")
	showInteractionLabel = true 
 	


func _on_body_exited(body: Player) -> void:
	$ObiektDetonator.texture = load("res://Textures/Objects/Boom Bomm/Obiekt - Detonator.png")
	showInteractionLabel = false
