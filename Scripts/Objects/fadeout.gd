extends Sprite2D

func _ready() -> void:
	modulate.a = 0.0
	
func fade_in():
	var fade_time := 2.0 
	var elapsed := 0.0
	visible = true

	while elapsed < fade_time:
		var delta := get_process_delta_time()
		elapsed += delta
		var alpha: float = lerp(0.0, 1.0, elapsed / fade_time)
		modulate.a = alpha
		await get_tree().process_frame 
