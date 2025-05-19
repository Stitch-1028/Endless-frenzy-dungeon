extends Node2D
class_name AttackBack

signal start_attack_back(direction:Vector2,force:float,duration:float)
signal stop_attack_back
@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.timeout.connect(on_time_out)

# 击退函数，接受击退方向、击退力度、击退时间
func apply_attack_back(direction:Vector2,force:float,duration:float):
#	当触发该函数时，意味着人物与敌人相互碰撞，人物或敌人发起攻击，两者被击退，触发此函数
	timer.wait_time = duration
	timer.start()
	start_attack_back.emit(direction,force,duration)

func on_time_out():
	stop_attack_back.emit()
