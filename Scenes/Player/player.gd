extends CharacterBody2D
class_name Player

@export var move_speed = 100
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var move_direction = Input.get_vector("MOVE_LEFT","MOVE_RIGHT","MOVE_UP","MOVE_DOWN")
	velocity = move_direction * move_speed
	handle_animation(move_direction)
	handle_rotation(move_direction)
	move_and_slide()

func handle_animation(move_direction:Vector2):
#	人物正在移动 播放run动画帧 反之则播放idle动画帧
	if move_direction.length() > 0:
		animated_sprite_2d.play('run')
	else:
		animated_sprite_2d.play('idle')

func handle_rotation(move_direction:Vector2):
#	玩家朝右边移动 修改动画节点的Scale属性
	if move_direction.x > 0:
		animated_sprite_2d.scale = Vector2(1,1)
	elif move_direction.x < 0:
		animated_sprite_2d.scale = Vector2(-1,1)
