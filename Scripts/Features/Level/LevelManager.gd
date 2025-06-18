extends Node
class_name LevelManager

@export var player : PlayerController
@export var enemies_container : Node
@export var spawn_point : Node2D
@export var current_scene_name: String
@export var next_scene_name: String
@export var ui_root: UIRoot
var score : int
signal score_changed(score: int)

func _ready() -> void:
	player.init()
	ui_root.init(self, player)
	player.global_position = spawn_point.global_position
	for enemy in enemies_container.get_children():
		if enemy is BaseEnemyController:
			enemy.init()
			enemy.health.on_died.connect(self.on_enemy_died)
	pass

func _on_finish_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		level_completed()

func level_completed() -> void:
	SceneLoader.load_scene_from_path(next_scene_name)

func restart_level() -> void:
	SceneLoader.load_scene_from_path(current_scene_name)
	pass

func on_enemy_died() -> void:
	score += 1
	emit_signal("score_changed", score)
	pass
