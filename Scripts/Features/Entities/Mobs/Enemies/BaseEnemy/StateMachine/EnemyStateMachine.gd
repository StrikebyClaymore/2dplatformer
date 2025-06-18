extends BaseStateMachine
class_name EnemyStateMachine

var target : PlayerController

func init(config: BaseEnemyConfig, view: BaseEnemyView, movement: BaseEnemyMovement, attack: BaseEnemyAttack) -> void:
	add_state("EnemyPatrolState", EnemyPatrolState.new(self, view, movement))
	add_state("EnemyChaseState", EnemyChaseState.new(self, config, view, movement))
	add_state("EnemyFightState", EnemyFightState.new(self, config, view, attack))
