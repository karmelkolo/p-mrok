extends Area2D

var showInteractionLabel = false

func _process(_delta: float) -> void:
	$Label.visible = showInteractionLabel
	
	

func _on_body_entered(body: Player) -> void:
	$ObiektDetonator.texture = load("res://Textures/Objects/Boom Bomm/Obiekt - Detonator (Interakcja).png")
	showInteractionLabel = true 
 	


func _on_body_exited(body: Player) -> void:
	$ObiektDetonator.texture = load("res://Textures/Objects/Boom Bomm/Obiekt - Detonator.png")
	showInteractionLabel = false
