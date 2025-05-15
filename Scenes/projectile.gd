extends Node2D
class_name Projectile

#子弹飞行速度
@export var flying_speed = 300
# 子弹飞行方向
var flying_direction:Vector2

func set_up(flying_direction:Vector2):
	self.flying_direction = flying_direction.normalized()
	rotate(flying_direction.angle())

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	global_position  +=  flying_direction * flying_speed * delta
