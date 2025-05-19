extends CharacterBody2D
class_name Player

@export var move_speed = 100
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var attack_back: AttackBack = $AttackBack

var is_attack_back = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	attack_back.start_attack_back.connect(on_start_attack_back)
	attack_back.stop_attack_back.connect(stop_attack_back)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_attack_back:
		move_and_slide()
		return
	var move_direction = Input.get_vector("MOVE_LEFT","MOVE_RIGHT","MOVE_UP","MOVE_DOWN")
	velocity = move_direction * move_speed
	Global.handle_animation(move_direction,animated_sprite_2d)
	Global.handle_rotation(move_direction,animated_sprite_2d)
	move_and_slide()

func on_start_attack_back(direction:Vector2,force:float,duration:float):
	is_attack_back = true
	velocity = direction * force

func stop_attack_back():
	is_attack_back = false
	velocity = Vector2.ZERO
