extends CharacterBody2D
class_name Enemy

@onready var chase_area: Area2D = $chaseArea
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var attack_area: Area2D = $AttackArea

var player:Player
@export var move_speed = 50
func _ready() -> void:
	chase_area.body_entered.connect(on_body_shape_entered)
	attack_area.body_entered.connect(on_attack_area_entered)
	
func _process(delta: float) -> void:
	chase_palyer()

# 检测人物位置
func on_body_shape_entered(body:Node2D):
	if body is Player:
		player = body
	
#追击玩家
func chase_palyer():
	var chase_direction = Vector2.ZERO
	if player != null:
		chase_direction = (player.global_position - global_position ).normalized()
	velocity = chase_direction * move_speed
	Global.handle_animation(chase_direction,animated_sprite_2d)
	Global.handle_rotation(chase_direction,animated_sprite_2d)
	move_and_slide()

# 触碰到了人类
func on_attack_area_entered(body:Node2D):
	var attck_back : AttackBack = body.get_node_or_null("AttackBack")
	if attck_back != null:
		var direction :Vector2 = (body.global_position - global_position).normalized()
		var force:float = 250
		var duration:float = 0.2
		attck_back.apply_attack_back(direction,force,duration)
