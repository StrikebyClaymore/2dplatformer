extends BaseState
class_name EnemyChaseState

var fsm : EnemyStateMachine
var config : BaseEnemyConfig
var view : BaseEnemyView
var movement : BaseEnemyMovement
var target : PlayerController
var chase : bool

func _init(_fsm: EnemyStateMachine, _config : BaseEnemyConfig, _view: BaseEnemyView, _movement: BaseEnemyMovement) -> void:
	self.fsm = _fsm
	self.config = _config
	self.view = _view
	self.movement = _movement
	pass

func enter() -> void:
	print("EnemyChaseState")
	target = fsm.target
	view.enemy_detector_area.connect("body_exited", self.on_enemy_detector_body_exited)
	view.fight_area.connect("body_entered", self.on_fight_area_body_entered)
	pass

func exit() -> void:
	target = null
	view.enemy_detector_area.disconnect("body_exited", self.on_enemy_detector_body_exited)
	view.fight_area.disconnect("body_entered", self.on_fight_area_body_entered)
	pass

func process(delta: float) -> void:
	if !target:
		return
	var distance = abs(view.global_position.x - target.global_position.x)
	chase = distance > config.chase_stop_distance
	pass

func physics_process(delta: float) -> void:
	if not view.floor_detector_left.is_colliding() or not view.floor_detector_right.is_colliding():
		movement.set_move_direction(0)
	elif target and chase:
		var direction = (target.global_position - view.global_position).normalized()
		movement.set_move_direction(sign(direction.x))
		movement.physics_process(delta)
	pass

func on_enemy_detector_body_exited(body: Node2D):
	if body == target:
		fsm.target = null
		fsm.enter("EnemyPatrolState")

func on_fight_area_body_entered(body: Node2D):
	if body is PlayerController:
		fsm.enter("EnemyFightState")
