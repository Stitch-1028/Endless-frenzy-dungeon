extends Node2D
class_name Projectile

#子弹飞行速度
@export var flying_speed = 300
# 子弹飞行方向
var flying_direction:Vector2
@onready var CollsionRange: Area2D = $CollsionRange
@export var impact_effect_scene:PackedScene

func set_up(flying_direction:Vector2):
	self.flying_direction = flying_direction.normalized()
	rotate(flying_direction.angle())

func _ready() -> void:
	CollsionRange.body_entered.connect(handler_entered)

func _process(delta: float) -> void:
	global_position  +=  flying_direction * flying_speed * delta

func handler_entered(body:Node2D):
#	与墙面或者敌人发生碰撞之后，子弹消失(移除节点)
#	这里使用了子弹消失的动画，目前为子弹与某个物品发生碰撞，此时将子弹的位置就是子弹爆炸播放的位置，只需要替换全局坐标即可
	var impact_effect:AnimatedSprite2D = impact_effect_scene.instantiate()
	get_tree().current_scene.add_child(impact_effect)
	impact_effect.global_position = global_position
	queue_free()
	
