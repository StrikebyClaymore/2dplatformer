extends BaseState
class_name EnemyPatrolState

var fsm : EnemyStateMachine
var view : BaseEnemyView
var movement : BaseEnemyMovement

func _init(_fsm: EnemyStateMachine, _view: BaseEnemyView, _movement: BaseEnemyMovement) -> void:
	self.view = _view
	self.movement = _movement
	self.fsm = _fsm
	pass

func enter() -> void:
	print("EnemyPatrolState")
	view.enemy_detector_area.connect("body_entered", self.on_enemy_detector_body_enetered)
	view.enemy_detector_area.disable()
	view.enemy_detector_area.enable()
	pass

func exit() -> void:
	view.enemy_detector_area.disconnect("body_entered", self.on_enemy_detector_body_enetered)
	pass
	
func process(delta: float) -> void:
	pass

func physics_process(delta: float) -> void:
	if not view.floor_detector_left.is_colliding():
		movement.set_move_direction(1)
	elif not view.floor_detector_right.is_colliding():
		movement.set_move_direction(-1)
	movement.physics_process(delta)
	pass

func on_enemy_detector_body_enetered(body: Node2D):
	if body is PlayerController:
		fsm.target = body
		fsm.enter("EnemyChaseState")
