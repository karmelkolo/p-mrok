extends Area2D

var showInteractionLabel = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Label.visible = showInteractionLabel
	
	if showInteractionLabel && Input.is_action_just_pressed("interact"):
		queue_free()

func _on_body_entered(body):
	if body is Player: showInteractionLabel = true

func _on_body_exited(body):
	if body is Player: showInteractionLabel = false
