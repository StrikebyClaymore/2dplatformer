extends BaseState
class_name EnemyFightState

var fsm : EnemyStateMachine
var config : BaseEnemyConfig
var view : BaseEnemyView
var attack : BaseEnemyAttack
var target : PlayerController

func _init(_fsm: EnemyStateMachine, _config : BaseEnemyConfig, _view: BaseEnemyView, _attack: BaseEnemyAttack) -> void:
	self.fsm = _fsm
	self.config = _config
	self.view = _view
	self.attack = _attack
	pass

func enter() -> void:
	print("EnemyFightState")
	target = fsm.target
	view.fight_area.connect("body_exited", self.on_fight_area_body_exited)
	pass

func exit() -> void:
	target = null
	view.fight_area.disconnect("body_exited", self.on_fight_area_body_exited)
	pass

func process(delta: float) -> void:
	attack.attack()
	pass

func physics_process(delta: float) -> void:
	pass

func on_fight_area_body_exited(body: Node2D):
	if body == target:
		fsm.target = null
		fsm.enter("EnemyPatrolState")
