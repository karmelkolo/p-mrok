extends StaticBody2D

var played = false
# Called when the node enters the scene tree for the first time.
var rng = RandomNumberGenerator.new()
var sec = rng.randf_range(0.0, 3.6)
func _ready() -> void:
	
	$AnimatedSprite2D.visible = false
	
	
	pass # Replace with function body.

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"../detonatorek".boomon:
		if played == false:
			played = true
			print("play")
			await get_tree().create_timer(sec).timeout
			
			$AnimatedSprite2D.visible = true
			$AnimationPlayer.play("wybuch")
			$boom.play()
		
		
	
		
	pass
