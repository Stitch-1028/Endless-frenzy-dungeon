extends AnimatedSprite2D

func _ready() -> void:
	animation_finished.connect(on_animation_finished)

func on_animation_finished():
	queue_free()
