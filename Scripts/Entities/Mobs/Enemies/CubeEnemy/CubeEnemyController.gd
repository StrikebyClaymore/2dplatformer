extends CharacterBody2D
class_name CubeEnemyController

@export var config : CubeEnemyConfig
@export var view: CubeEnemyView

var movement := CubeEnemyMovement.new()
var health := CubeEnemyHealth.new()

func init() -> void:
	movement.init(config, view)
	health.init(config, view)
	health.on_died.connect(self.death_tween)
	pass

func _process(_delta: float) -> void:
	movement.process(_delta)
	pass

func death_tween():
	var tween = self.create_tween()
	tween.tween_property(self, "scale", Vector2.ZERO, config.death_tween_duration)
	await tween.finished
	self.queue_free()
