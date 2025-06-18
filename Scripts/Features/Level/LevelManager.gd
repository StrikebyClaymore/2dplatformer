extends Node
class_name LevelManager

@export var player : PlayerController
@export var enemies_container : Node
@export var spawn_point : Node2D
@export var current_scene_name: String
@export var next_scene_name: String
@export var ui_root: UIRoot

func _ready() -> void:
	player.init()
	ui_root.init(player)
	player.global_position = spawn_point.global_position
	player.health.on_died.connect(self.on_player_died)
	for enemy in enemies_container.get_children():
		if enemy is BaseEnemyController:
			enemy.init()
	pass

func _on_finish_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		level_completed()

func level_completed() -> void:
	SceneLoader.load_scene_from_path(next_scene_name)

func on_player_died() -> void:
	SceneLoader.load_scene_from_path(current_scene_name)
	pass
