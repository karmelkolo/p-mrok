extends Sprite2D

func _ready() -> void:
	modulate.a = 1.0
	
	fade_out()
	
func fade_out():
	var fade_time := 5.0 
	var elapsed := 0.0

	while elapsed < fade_time:
		var delta := get_process_delta_time()
		elapsed += delta
		var alpha: float = lerp(1.0, 0.0, elapsed / fade_time)
		modulate.a = alpha
		await get_tree().process_frame 
	visible = false
