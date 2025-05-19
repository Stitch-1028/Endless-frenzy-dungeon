extends Node
# 尝试使用全局函数, 类似在window中绑定方法，使全局可用，全局名称自己在项目设置中自己定义
static func handle_animation(move_direction:Vector2,this:AnimatedSprite2D):
#	正在移动的节点 播放run动画帧 反之则播放idle动画帧
	return move_direction.length() > 0
	if move_direction.length() > 0:
		this.play('run')
	else:
		this.play('idle')

static func handle_rotation(move_direction:Vector2,this:AnimatedSprite2D):
#	朝右边移动的节点 修改动画节点的Scale属性
	if move_direction.x > 0:
		this.scale = Vector2(1,1)
	elif move_direction.x < 0:
		this.scale = Vector2(-1,1)
