extends Node2D

var start_shooting = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		start_shooting = true
	

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass
