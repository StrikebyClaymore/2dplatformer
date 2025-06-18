extends CharacterBody2D
class_name BaseEnemyController

@export var config : BaseEnemyConfig
@export var view: BaseEnemyView

var movement := BaseEnemyMovement.new()
var health := BaseEnemyHealth.new()
var attack := BaseEnemyAttack.new()
var fsm := EnemyStateMachine.new()

func init() -> void:
	movement.init(config, view)
	health.init(config, view)
	attack.init(config, view)
	health.on_died.connect(self.death_tween)
	fsm.init(config, view, movement, attack)
	fsm.enter("EnemyPatrolState")
	pass

func _process(delta: float) -> void:
	fsm.process(delta)
	pass

func _physics_process(delta: float) -> void:
	fsm.physics_process(delta)
	pass

func death_tween():
	var tween = self.create_tween()
	tween.tween_property(self, "scale", Vector2.ZERO, config.death_tween_duration)
	await tween.finished
	self.queue_free()
