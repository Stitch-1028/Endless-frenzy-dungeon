extends Node2D

@export var projectile_scene: PackedScene
# 是否正在射击
var start_shooting = false
# 子弹是否准备就绪
var ready_to_shoot = true
@onready var shoot_timer: Timer = $ShootTimer

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		start_shooting = true
	if event.is_action_released("shoot"):
		start_shooting = false

func _ready() -> void:
#	连接节点Timer的信号
	shoot_timer.timeout.connect(on_time_out)
	
func _process(delta: float) -> void:
	handle_shoot()

#监听时间事件
func on_time_out():
#	子弹冷却结束，子弹就可以射击
	ready_to_shoot = true
	
	
func handle_shoot():
	if not start_shooting:
		return
	if not ready_to_shoot:
		return
#	生产子弹实例
	var projectile:Projectile = projectile_scene.instantiate() as Projectile
#   获取主场景节点，将生成的子弹放作为子节点放入其中
	get_tree().current_scene.add_child(projectile)
	
#	获取鼠标点击时的坐标，将子弹朝向鼠标点击的位置发射
	var mouse_global_positon = get_global_mouse_position()
#	子弹的运动方向：鼠标方向 - 当前节点的位置
	var shoot_dicection = mouse_global_positon - global_position
	
#	改子弹的射击方向
	projectile.set_up(shoot_dicection)
#	子弹初始坐标：当前人物位置
	projectile.global_position = global_position
#	子弹进入冷却时间
	shoot_timer.start()
	ready_to_shoot = false
